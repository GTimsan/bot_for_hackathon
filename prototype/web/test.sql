--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adminka_bookings; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.adminka_bookings (
    id integer NOT NULL,
    status character varying(3),
    start_time timestamp with time zone,
    fin_time timestamp with time zone,
    object_id integer,
    user_id integer,
    campus_id integer
);


ALTER TABLE public.adminka_bookings OWNER TO school;

--
-- Name: adminka_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.adminka_bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adminka_bookings_id_seq OWNER TO school;

--
-- Name: adminka_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.adminka_bookings_id_seq OWNED BY public.adminka_bookings.id;


--
-- Name: adminka_campuses; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.adminka_campuses (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.adminka_campuses OWNER TO school;

--
-- Name: adminka_campuses_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.adminka_campuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adminka_campuses_id_seq OWNER TO school;

--
-- Name: adminka_campuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.adminka_campuses_id_seq OWNED BY public.adminka_campuses.id;


--
-- Name: adminka_objects; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.adminka_objects (
    id integer NOT NULL,
    name character varying(100),
    object_type_id integer,
    "desc" character varying(500),
    image character varying(200),
    floor integer,
    room_number integer,
    campus_id integer
);


ALTER TABLE public.adminka_objects OWNER TO school;

--
-- Name: adminka_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.adminka_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adminka_objects_id_seq OWNER TO school;

--
-- Name: adminka_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.adminka_objects_id_seq OWNED BY public.adminka_objects.id;


--
-- Name: adminka_objecttypes; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.adminka_objecttypes (
    id integer NOT NULL,
    name character varying(100),
    campus_id integer
);


ALTER TABLE public.adminka_objecttypes OWNER TO school;

--
-- Name: adminka_objecttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.adminka_objecttypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adminka_objecttypes_id_seq OWNER TO school;

--
-- Name: adminka_objecttypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.adminka_objecttypes_id_seq OWNED BY public.adminka_objecttypes.id;


--
-- Name: adminka_users; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.adminka_users (
    id integer NOT NULL,
    "group" character varying(3),
    school_login character varying(100),
    username character varying(100) NOT NULL,
    phone_number character varying(100),
    telegram_id bigint NOT NULL,
    campus_id integer,
    full_name character varying(100),
    confirmed boolean
);


ALTER TABLE public.adminka_users OWNER TO school;

--
-- Name: adminka_users_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.adminka_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adminka_users_id_seq OWNER TO school;

--
-- Name: adminka_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.adminka_users_id_seq OWNED BY public.adminka_users.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO school;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO school;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO school;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO school;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO school;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO school;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO school;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO school;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO school;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO school;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO school;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO school;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO school;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO school;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO school;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO school;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO school;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: school
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO school;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: school
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO school;

--
-- Name: adminka_bookings id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_bookings ALTER COLUMN id SET DEFAULT nextval('public.adminka_bookings_id_seq'::regclass);


--
-- Name: adminka_campuses id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_campuses ALTER COLUMN id SET DEFAULT nextval('public.adminka_campuses_id_seq'::regclass);


--
-- Name: adminka_objects id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_objects ALTER COLUMN id SET DEFAULT nextval('public.adminka_objects_id_seq'::regclass);


--
-- Name: adminka_objecttypes id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_objecttypes ALTER COLUMN id SET DEFAULT nextval('public.adminka_objecttypes_id_seq'::regclass);


--
-- Name: adminka_users id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_users ALTER COLUMN id SET DEFAULT nextval('public.adminka_users_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: adminka_bookings; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.adminka_bookings (id, status, start_time, fin_time, object_id, user_id, campus_id) FROM stdin;
\.


--
-- Data for Name: adminka_campuses; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.adminka_campuses (id, name) FROM stdin;
2	ЁЯПл Moscow
3	ЁЯПм Kazan
1	ЁЯПв Novosibirsk ЁЯдШ
\.


--
-- Data for Name: adminka_objects; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.adminka_objects (id, name, object_type_id, "desc", image, floor, room_number, campus_id) FROM stdin;
36	╨в╨╡╨╜╨╜╨╕╤Б	4	╨Э╨░╤Б╤В╨╛╨╗╤М╨╜╤Л╨╣ ╤В╨╡╨╜╨╜╨╕╤Б, ╨┤╨╗╤П ╨╗╤О╨▒╨╕╤В╨╡╨╗╨╡╨╣ ╨░╨║╤В╨╕╨▓╨╜╨╛╨│╨╛ ╨╛╤В╨┤╤Л╤Е╨░	no	18	4	1
37	╨Ф╨╛╤Б╨║╨░ ╨┤╨╗╤П ╤А╨╕╤Б╨╛╨▓╨░╨╜╨╕╤П	4	╨Ш╤Б╨┐╨╛╨╗╤М╨╖╤Г╨╡╤В╤Б╤П ╨┤╨╗╤П ╤А╨░╨╖╨╜╤Л╤Е ╨╜╨░╨╖╨╜╨░╤З╨╡╨╜╨╕╨╣)	no	18	4	1
38	╨е╨╛╨╗ 18 ╤Н╤В╨░╨╢	1	╨е╨╛╨╗ ╨╜╨░ 18 ╤Н╤В╨░╨╢╨╡	no	18	5	1
39	╨Ъ╤Г╤Е╨╜╤П 17 ╤Н╤В╨░╨╢	1	╨Ъ╤Г╤Е╨╜╤П ╨╜╨░ 17 ╤Н╤В╨░╨╢╨╡	no	17	7	1
40	╨Ъ╤Г╤Е╨╜╤П 18 ╤Н╤В╨░╨╢	1	╨Ъ╤Г╤Е╨╜╤П ╨╜╨░ 18 ╤Н╤В╨░╨╢╨╡	no	18	9	1
41	╨Я╨╡╤А╨╡╨│╨╛╨▓╨╛╤А╨║╨░ 20 ╤Н╤В╨░╨╢	1	╨Ъ╨╛╨╝╨╜╨░╤В╨░ ╨┤╨╗╤П ╨┐╨╡╤А╨╡╨│╨╛╨▓╨╛╤А╨╛╨▓	no	20	12	1
42	╨Я╨╡╤А╨╡╨│╨╛╨▓╨╛╤А╨║╨░ 18 ╤Н╤В╨░╨╢	1	╨Ъ╨╛╨╝╨╜╨░╤В╨░ ╨┤╨╗╤П ╨┐╨╡╤А╨╡╨│╨╛╨▓╨╛╤А╨╛╨▓ ╨╜╨░ 18 ╤Н╤В╨░╨╢╨╡	no	18	41	1
34	ЁЯО╕ ╨У╨╕╤В╨░╤А╨░	2	╨и╨╡╤Б╤В╤М ╤Б╤В╤А╤Г╨╜	https://music-hummer.ru/upload/iblock/edc/edc6c9af7f58cb220b393e81587d9234.jpg	20	3	1
100	╨в╨╡╨╜╨╜╨╕╤Б\n	4	╨Э╨░╤Б╤В╨╛╨╗╤М╨╜╤Л╨╣ ╤В╨╡╨╜╨╜╨╕╤Б ╨┤╨╗╤П ╨╗╤О╨▒╨╕╤В╨╡╨╗╨╡╨╣ ╨░╨║╤В╨╕╨▓╨╜╨╛╨│╨╛ ╨╛╤В╨┤╤Л╤Е╨░\n	https://iqplanet.ru/upload/iblock/58d/58d1c5bfcea3e9cf75acbb1d382dfc1d.jpg	20	0	1
101	╨Ф╨╛╤Б╨║╨░ ╨┤╨╗╤П ╤А╨╕╤Б╨╛╨▓╨░╨╜╨╕╤П\n	4		https://www.shop.kostyor.ru/images/cat/197/fs/8707.jpg	17	0	1
102	╨Ф╨╛╤Б╨║╨░ ╨┤╨╗╤П ╤А╨╕╤Б╨╛╨▓╨░╨╜╨╕╤П\n	4		https://www.shop.kostyor.ru/images/cat/197/fs/8707.jpg	18	0	1
103	╨Ф╨╛╤Б╨║╨░ ╨┤╨╗╤П ╤А╨╕╤Б╨╛╨▓╨░╨╜╨╕╤П\n	4		https://www.shop.kostyor.ru/images/cat/197/fs/8707.jpg	20	0	1
104	╨е╨╛╨╗╨╗ 17 ╤Н╤В╨░╨╢╨░\n	1	╨е╨╛╨╗╨╗ 17 ╤Н╤В╨░╨╢╨░\n	https://sib.fm/storage/article/July2021/85vBbkTrRno.jpg	17	171	1
105	╨е╨╛╨╗╨╗ 18 ╤Н╤В╨░╨╢╨░\n	1	╨е╨╛╨╗╨╗ 18 ╤Н╤В╨░╨╢╨░\n	https://avatars.mds.yandex.net/get-altay/5099256/2a00000181425b052c7ff9434e358f5a7dbf/XXL	18	181	1
106	╨е╨╛╨╗╨╗ 20 ╤Н╤В╨░╨╢╨░\n	1	╨е╨╛╨╗╨╗ 20 ╤Н╤В╨░╨╢╨░\n	https://avatars.mds.yandex.net/get-altay/5099256/2a00000181425b052c7ff9434e358f5a7dbf/XXL	20	201	1
107	╨Ъ╤Г╤Е╨╜╤П 17 ╤Н╤В╨░╨╢╨░\n	1	╨Ъ╤Г╤Е╨╜╤П 17 ╤Н╤В╨░╨╢╨░\n	https://21-school.ru/assets/images/kampuses/kazan/kazan-6.webp	17	172	1
108	╨Ъ╤Г╤Е╨╜╤П 18 ╤Н╤В╨░╨╢╨░\n	1	╨Ъ╤Г╤Е╨╜╤П 18 ╤Н╤В╨░╨╢╨░\n	https://21-school.ru/assets/images/kampuses/kazan/kazan-6.webp	18	182	1
109	╨Ъ╤Г╤Е╨╜╤П 20 ╤Н╤В╨░╨╢╨░\n	1	╨Ъ╤Г╤Е╨╜╤П 20 ╤Н╤В╨░╨╢╨░\n	https://21-school.ru/assets/images/kampuses/kazan/kazan-6.webp	20	202	1
43	ЁЯХ╣ Play Station 5 Pro	2	╨Я╨╗╨╛╨╣╨║╨░	https://3dnews.ru/assets/external/illustrations/2021/10/06/1050675/cav1.jpg	20	34	1
111	тЪ╜я╕П ╨Ъ╨╕╨║╨╡╤А	2	╨Ф╨╗╤П ╨╗╤О╨▒╨╕╤В╨╡╨╗╨╡╨╣ ╤Д╤Г╤В╨▒╨╛╨╗╨░	https://www.weekend-billiard.ru/upload/iblock/fc7/5394_large5.jpg	18	183	1
112	ЁЯПТ ╨Р╤Н╤А╨╛╤Е╨╛╨║╨║╨╡╨╣	2	╨Ф╨╗╤П ╨╗╤О╨▒╨╕╤В╨╡╨╗╨╡╨╣ ╤Е╨╛╨║╨║╨╡╤П	https://www.weekend-billiard.ru/upload/iblock/da8/5422_large5_1.jpg	18	183	1
35	ЁЯО░ ╨Ш╨│╤А╨╛╨▓╨╛╨╣ ╨░╨▓╤В╨╛╨╝╨░╤В	2	╨Ш╨│╤А╨╛╨▓╨╛╨╣ ╨░╨▓╤В╨╛╨╝╨░╤В "╨в╤А╨╕ ╤В╨╛╨┐╨╛╤А╨░"	https://s.0532.ua/section/promonewsintext/upload/images/promo/intext/000/054/752/0532-2_62dbea473215d.jpg	20	3	1
110	ЁЯОп ╨Ф╨░╤А╤В╤Б	2	╨Ф╨╗╤П ╨╗╤О╨▒╨╕╤В╨╡╨╗╨╡╨╣ ╨┐╨╛╨║╨╕╨┤╨░╤В╤М╤Б╤П ╤З╨╡╨╝-╨╜╨╕╨▒╤Г╨┤╤М ╨╛╤Б╤В╤А╤Л╨╝	https://cdn3.static1-sima-land.com/items/4490132/0/400.jpg?v=1598429123	20	203	1
1	ЁЯОо XBOX	2	╨Ш╨│╤А╨╛╨▓╨░╤П ╨┐╤А╨╕╤Б╤В╨░╨▓╨║╨░ ╨┐╨╛╨┤╨║╨╗╤О╤З╨╡╨╜╨╜╨░╤П ╨║ ╨▒╨╛╨╗╤М╤И╨╛╨╝╤Г ╨╝╨╛╨╜╨╕╤В╨╛╤А╤Г (4 ╨│╨╡╨╣╨╝╨┐╨░╨┤╨░)	https://www.ixbt.com/img/n1/news/2022/0/4/b8bbffcd-3e6c-4609-a361-ef8c1ab13349_large.jpg	20	3	1
113	ЁЯд╝тАНтЩВя╕П ╨Ь╨╛╤А╤В╨░╨╗ ╨║╨╛╨╝╨▒╨░╤В	2	╨Ш╨│╤А╨╛╨▓╨╛╨╣ ╨░╨▓╤В╨╛╨╝╨░╤В "╨Ь╨╛╤А╤В╨░╨╗ ╨║╨╛╨╝╨▒╨╛╤В"	https://3-8d.ru/upload/resize_cache/iblock/30e/1200_1200_140cd750bba9870f18aada2478b24840a/30e1a360edf5f947d0c4ead6ea7c5f98.jpg	20	203	1
\.


--
-- Data for Name: adminka_objecttypes; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.adminka_objecttypes (id, name, campus_id) FROM stdin;
2	ЁЯОк ╨Ю╨▒╤К╨╡╨║╤В╤Л ╨╕╨│╤А╨╛╨▓╨╛╨╣	1
4	ЁЯТИ ╨а╨░╨╖╨╜╨╛╨╡	1
1	ЁЯкЯ ╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡	1
6	ЁЯН╜ ╨Ъ╤Г╤Е╨╜╤П	1
\.


--
-- Data for Name: adminka_users; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.adminka_users (id, "group", school_login, username, phone_number, telegram_id, campus_id, full_name, confirmed) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add ╨Я╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤П	7	add_users
26	Can change ╨Я╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤П	7	change_users
27	Can delete ╨Я╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤П	7	delete_users
28	Can view ╨Я╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤П	7	view_users
29	Can add ╨Ъ╨░╨╝╨┐╤Г╤Б	8	add_campuses
30	Can change ╨Ъ╨░╨╝╨┐╤Г╤Б	8	change_campuses
31	Can delete ╨Ъ╨░╨╝╨┐╤Г╤Б	8	delete_campuses
32	Can view ╨Ъ╨░╨╝╨┐╤Г╤Б	8	view_campuses
33	Can add ╨Ю╨▒╤К╨╡╨║╤В	9	add_objects
34	Can change ╨Ю╨▒╤К╨╡╨║╤В	9	change_objects
35	Can delete ╨Ю╨▒╤К╨╡╨║╤В	9	delete_objects
36	Can view ╨Ю╨▒╤К╨╡╨║╤В	9	view_objects
37	Can add ╨С╤А╨╛╨╜╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡	10	add_bookings
38	Can change ╨С╤А╨╛╨╜╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡	10	change_bookings
39	Can delete ╨С╤А╨╛╨╜╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡	10	delete_bookings
40	Can view ╨С╤А╨╛╨╜╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡	10	view_bookings
41	Can add ╨в╨╕╨┐ ╨Ю╨▒╤К╨╡╨║╤В╨░	11	add_objecttypes
42	Can change ╨в╨╕╨┐ ╨Ю╨▒╤К╨╡╨║╤В╨░	11	change_objecttypes
43	Can delete ╨в╨╕╨┐ ╨Ю╨▒╤К╨╡╨║╤В╨░	11	delete_objecttypes
44	Can view ╨в╨╕╨┐ ╨Ю╨▒╤К╨╡╨║╤В╨░	11	view_objecttypes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$rEvF3fHjY0jAdETUPLwKqa$kKYjcoq9ipmFWM+La7Rdkbm0N6xHPlLmbNDuj2ZAv/8=	2022-08-19 21:15:37.68676+00	t	user			asdfghj@mail.ru	t	t	2022-08-19 21:14:19.081673+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	adminka	users
8	adminka	campuses
9	adminka	objects
10	adminka	bookings
11	adminka	objecttypes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-19 21:13:06.935426+00
2	auth	0001_initial	2022-08-19 21:13:07.085891+00
3	admin	0001_initial	2022-08-19 21:13:07.137271+00
4	admin	0002_logentry_remove_auto_add	2022-08-19 21:13:07.156565+00
5	admin	0003_logentry_add_action_flag_choices	2022-08-19 21:13:07.173828+00
6	adminka	0001_initial	2022-08-19 21:13:07.191587+00
7	adminka	0002_auto_20220816_1143	2022-08-19 21:13:07.210661+00
8	adminka	0003_auto_20220816_1527	2022-08-19 21:13:07.320821+00
9	adminka	0004_auto_20220816_1657	2022-08-19 21:13:07.338526+00
10	adminka	0005_alter_users_group	2022-08-19 21:13:07.352746+00
11	adminka	0006_alter_users_group	2022-08-19 21:13:07.369584+00
12	adminka	0007_alter_users_group	2022-08-19 21:13:07.383099+00
13	adminka	0008_alter_users_group	2022-08-19 21:13:07.395716+00
14	adminka	0009_users_confirmed	2022-08-19 21:13:07.408087+00
15	adminka	0010_auto_20220816_2318	2022-08-19 21:13:07.47357+00
16	adminka	0011_alter_objects_image	2022-08-19 21:13:07.485813+00
17	adminka	0012_alter_objects_floor	2022-08-19 21:13:07.501276+00
18	adminka	0013_auto_20220817_0705	2022-08-19 21:13:07.526038+00
19	adminka	0014_bookings_campus	2022-08-19 21:13:07.548546+00
20	adminka	0015_alter_bookings_status	2022-08-19 21:13:07.580413+00
21	adminka	0016_auto_20220817_0856	2022-08-19 21:13:07.656476+00
22	adminka	0017_alter_bookings_user	2022-08-19 21:13:07.666071+00
23	contenttypes	0002_remove_content_type_name	2022-08-19 21:13:07.702265+00
24	auth	0002_alter_permission_name_max_length	2022-08-19 21:13:07.720658+00
25	auth	0003_alter_user_email_max_length	2022-08-19 21:13:07.7405+00
26	auth	0004_alter_user_username_opts	2022-08-19 21:13:07.758474+00
27	auth	0005_alter_user_last_login_null	2022-08-19 21:13:07.775489+00
28	auth	0006_require_contenttypes_0002	2022-08-19 21:13:07.780549+00
29	auth	0007_alter_validators_add_error_messages	2022-08-19 21:13:07.797918+00
30	auth	0008_alter_user_username_max_length	2022-08-19 21:13:07.82426+00
31	auth	0009_alter_user_last_name_max_length	2022-08-19 21:13:07.842662+00
32	auth	0010_alter_group_name_max_length	2022-08-19 21:13:07.861317+00
33	auth	0011_update_proxy_permissions	2022-08-19 21:13:07.887421+00
34	auth	0012_alter_user_first_name_max_length	2022-08-19 21:13:07.900261+00
35	sessions	0001_initial	2022-08-19 21:13:07.931779+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: school
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
82ervymgdtgjoa3bm2b65vzabtu3lfhj	.eJxVjDsOwjAQBe_iGlmOf7Ep6TmDtZtd4wCypTipEHeHSCmgfTPzXiLBtpa0dV7STOIsBnH63RCmB9cd0B3qrcmp1XWZUe6KPGiX10b8vBzu30GBXr41k4-GgzUGx9EhOMVWKfaRnM-DIW1syJoc5GA9kkYGjByiQZ8ZNYj3B-FJOG0:1oP9L7:WbXSfUqzx9Bi6QwK2ewgpI359avtuW-QUdnqS-OQ6J4	2022-09-02 21:15:37.689669+00
\.


--
-- Name: adminka_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.adminka_bookings_id_seq', 1, false);


--
-- Name: adminka_campuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.adminka_campuses_id_seq', 1, false);


--
-- Name: adminka_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.adminka_objects_id_seq', 1, false);


--
-- Name: adminka_objecttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.adminka_objecttypes_id_seq', 1, false);


--
-- Name: adminka_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.adminka_users_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: adminka_bookings adminka_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_bookings
    ADD CONSTRAINT adminka_bookings_pkey PRIMARY KEY (id);


--
-- Name: adminka_campuses adminka_campuses_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_campuses
    ADD CONSTRAINT adminka_campuses_pkey PRIMARY KEY (id);


--
-- Name: adminka_objects adminka_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_objects
    ADD CONSTRAINT adminka_objects_pkey PRIMARY KEY (id);


--
-- Name: adminka_objecttypes adminka_objecttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_objecttypes
    ADD CONSTRAINT adminka_objecttypes_pkey PRIMARY KEY (id);


--
-- Name: adminka_users adminka_users_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_users
    ADD CONSTRAINT adminka_users_pkey PRIMARY KEY (id);


--
-- Name: adminka_users adminka_users_telegram_id_key; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_users
    ADD CONSTRAINT adminka_users_telegram_id_key UNIQUE (telegram_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: adminka_bookings_campus_id_fccba348; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX adminka_bookings_campus_id_fccba348 ON public.adminka_bookings USING btree (campus_id);


--
-- Name: adminka_bookings_object_id_id_f7c562d0; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX adminka_bookings_object_id_id_f7c562d0 ON public.adminka_bookings USING btree (object_id);


--
-- Name: adminka_bookings_user_id_id_124478e9; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX adminka_bookings_user_id_id_124478e9 ON public.adminka_bookings USING btree (user_id);


--
-- Name: adminka_objects_campus_id_id_60f72e9c; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX adminka_objects_campus_id_id_60f72e9c ON public.adminka_objects USING btree (campus_id);


--
-- Name: adminka_objects_object_type_id_a97bc2b1; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX adminka_objects_object_type_id_a97bc2b1 ON public.adminka_objects USING btree (object_type_id);


--
-- Name: adminka_objecttypes_campus_id_e346a96e; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX adminka_objecttypes_campus_id_e346a96e ON public.adminka_objecttypes USING btree (campus_id);


--
-- Name: adminka_users_campus_id_id_268befff; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX adminka_users_campus_id_id_268befff ON public.adminka_users USING btree (campus_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: school
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: adminka_bookings adminka_bookings_campus_id_fccba348_fk_adminka_campuses_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_bookings
    ADD CONSTRAINT adminka_bookings_campus_id_fccba348_fk_adminka_campuses_id FOREIGN KEY (campus_id) REFERENCES public.adminka_campuses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adminka_bookings adminka_bookings_object_id_4467b0fb_fk_adminka_objects_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_bookings
    ADD CONSTRAINT adminka_bookings_object_id_4467b0fb_fk_adminka_objects_id FOREIGN KEY (object_id) REFERENCES public.adminka_objects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adminka_bookings adminka_bookings_user_id_32a16b78_fk_adminka_users_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_bookings
    ADD CONSTRAINT adminka_bookings_user_id_32a16b78_fk_adminka_users_id FOREIGN KEY (user_id) REFERENCES public.adminka_users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adminka_objects adminka_objects_campus_id_4224f301_fk_adminka_campuses_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_objects
    ADD CONSTRAINT adminka_objects_campus_id_4224f301_fk_adminka_campuses_id FOREIGN KEY (campus_id) REFERENCES public.adminka_campuses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adminka_objects adminka_objects_object_type_id_a97bc2b1_fk_adminka_o; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_objects
    ADD CONSTRAINT adminka_objects_object_type_id_a97bc2b1_fk_adminka_o FOREIGN KEY (object_type_id) REFERENCES public.adminka_objecttypes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adminka_objecttypes adminka_objecttypes_campus_id_e346a96e_fk_adminka_campuses_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_objecttypes
    ADD CONSTRAINT adminka_objecttypes_campus_id_e346a96e_fk_adminka_campuses_id FOREIGN KEY (campus_id) REFERENCES public.adminka_campuses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adminka_users adminka_users_campus_id_bbd4ba00_fk_adminka_campuses_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.adminka_users
    ADD CONSTRAINT adminka_users_campus_id_bbd4ba00_fk_adminka_campuses_id FOREIGN KEY (campus_id) REFERENCES public.adminka_campuses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: school
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

