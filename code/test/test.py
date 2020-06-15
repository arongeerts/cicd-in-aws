import unittest

from app.controller import APIController


class TestController(unittest.TestCase):
    def test_hello(self):
        controller = APIController()
        assert controller.hello("world") == 'Hello World'
