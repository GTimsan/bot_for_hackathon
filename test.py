import unittest
from call import Call
#Test cases to test Calulator methods
#You always create  a child class derived from unittest.TestCase
class TestCall(unittest.TestCase):
  #setUp method is overridden from the parent class TestCase
  def setUp(self):
    self.call = Call()
  #Each test method starts with the keyword test_
  def test_1(self):
    self.assertEqual(self.call.add(4,7), 11)
  def test_2(self):
    self.assertEqual(self.call.subtract(10,5), 5)
  def test_3(self):
    self.assertEqual(self.call.multiply(3,7), 21)
  def test_4(self):
    self.assertEqual(self.call.divide(10,2), 5)
# Executing the tests in the above test case class
if __name__ == "__main__":
  unittest.main()