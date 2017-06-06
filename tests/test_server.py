""" Fake test file to set up testing
"""

import unittest

from backend import server

class TestServer(unittest.TestCase):
    def test_heartbeat(self):
        """Test heartbeat"""
        response = server.heartbeat()
        expected = ';)'
        self.assertEquals(response, expected)
