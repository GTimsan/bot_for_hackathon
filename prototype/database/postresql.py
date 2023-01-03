import datetime
from typing import Union

import asyncpg
from asyncpg import Connection
from asyncpg.pool import Pool

import config


offset = datetime.timezone(datetime.timedelta(hours=3))

class Database:

    def __init__(self):
        self.pool: Union[Pool, None] = None

    async def create(self):
        self.pool = await asyncpg.create_pool(
            user=config.DB_USER,
            password=config.DB_PASS,
            host=config.DB_HOST,
            database=config.DB_NAME,
            port=config.DB_PORT

        )

    async def execute(self, command, *args,
                      fetch: bool = False,
                      fetchval: bool = False,
                      fetchrow: bool = False,
                      execute: bool = False
                      ):
        async with self.pool.acquire() as connection:
            connection: Connection
            async with connection.transaction():
                if fetch:
                    result = await connection.fetch(command, *args)
                elif fetchval:
                    result = await connection.fetchval(command, *args)
                elif fetchrow:
                    result = await connection.fetchrow(command, *args)
                elif execute:
                    result = await connection.execute(command, *args)
                return result

    # async def create_tables(self):
    #     sql = """
    #     CREATE TABLE IF NOT EXISTS school_user (
    #     id SERIAL PRIMARY KEY,
    #     full_name VARCHAR(255) NOT NULL,
    #     username VARCHAR(255) NOT NULL,
    #     telegram_id BIGINT NOT NULL UNIQUE
    #     );"""
    #     await self.execute(sql, execute=True)
        
        
    @staticmethod
    def format_args(sql, parametrs: dict):
        sql += " AND ".join([
            f"{item} = ${num}" for num, item in enumerate(parametrs.keys(),
                                                          start=1)
        ])
        return sql, tuple(parametrs.values())

    async def select_user(self, **kwargs):
        sql = "SELECT * FROM adminka_users WHERE "
        sql, parameters = self.format_args(sql, parametrs=kwargs)
        return await self.execute(sql, *parameters, fetchrow=True)

##################################### USERS TABLE ###########################################

    async def add_user(self, username, telegram_id, full_name, group=1):
        sql = "INSERT INTO adminka_users (username, telegram_id, full_name, \"group\") VALUES($1, $2, $3, $4) RETURNING *"
        return await self.execute(sql, username, telegram_id, full_name, group, fetchrow=True)

    async def update_campus(self, campus_id, telegram_id):
        sql = "UPDATE adminka_users SET campus_id=$1 WHERE telegram_id=$2"
        return await self.execute(sql, campus_id, telegram_id, execute=True)

    async def get_user_group(self, telegram_id):
        sql = 'SELECT "group" FROM adminka_users WHERE telegram_id=$1'
        return await self.execute(sql, telegram_id, fetchval=True)
    
    
##################################### CAMPUSES TABLE ###########################################
    async def get_campus_by_id(self, id):
        sql = 'SELECT * FROM adminka_campuses WHERE id=$1'
        return await self.execute(sql, id, fetchrow=True)
##################################### OBJECTS TABLE ###########################################
    async def get_objects(self, campus_id, object_type_id):
        sql = 'SELECT * FROM adminka_objects WHERE campus_id=$1 AND object_type_id=$2'
        return await self.execute(sql, campus_id, object_type_id, fetch=True)

    async def get_object_by_id(self, id):
        sql = 'SELECT * FROM adminka_objects WHERE id=$1'
        return await self.execute(sql, id, fetchrow=True)
    
##################################### OBJECT_TYPES TABLE ###########################################
    async def get_types_by_campus(self, campus_id):
        sql = 'SELECT * FROM adminka_objecttypes WHERE campus_id=$1'
        return await self.execute(sql, campus_id, fetch=True)

    async def get_type_by_id(self, id):
        sql = 'SELECT * FROM adminka_objecttypes WHERE id=$1'
        return await self.execute(sql, id, fetchrow=True)


##################################### BOOKINGS TABLE ###########################################

    async def add_booking(self, start_time, fin_time, user_id, object_id, campus_id, status='1'):
        sql = "INSERT INTO adminka_bookings (start_time, fin_time, user_id, object_id, campus_id, status) VALUES($1, $2, $3, $4, $5, $6)"
        return await self.execute(sql, start_time, fin_time, user_id, object_id, campus_id, status, execute=True)

    async def del_booking(self, start_time, user_id, object_id, campus_id):
        sql = "DELETE FROM adminka_bookings WHERE start_time=$1 AND user_id=$2 AND object_id=$3 AND campus_id=$4 "
        return await self.execute(sql, start_time, user_id, object_id, campus_id, execute=True)

    async def select_all_bookings_objects(self, object_id, status):
        sql = "SELECT * FROM adminka_bookings WHERE start_time BETWEEN now()::timestamp AND date_trunc('min', date_trunc('day', current_date::TIMESTAMP) + '1 day'::INTERVAL) AND object_id=$1 AND status=$2 "
        return await self.execute(sql, object_id, status, fetch=True)

    async def select_for_my_bookings(self, user_id):
        sql = "SELECT * FROM adminka_bookings WHERE start_time > now()::timestamp AND user_id=$1 ORDER BY start_time DESC"
        return await self.execute(sql, user_id, fetch=True)

    async def del_booking_by_id(self, id):
        sql = "DELETE FROM adminka_bookings WHERE id=$1 "
        return await self.execute(sql, id, execute=True)
    
    async def bookings_by_date(self, date, object_id):
        sql = "SELECT * FROM adminka_bookings WHERE start_time BETWEEN to_date($1, 'yyyy.mm.dd') AND to_date($1,'yyyy.mm.dd') + '1 day'::INTERVAL - '1 min'::INTERVAL AND object_id=$2"
        return await self.execute(sql, date, object_id, fetch=True)        