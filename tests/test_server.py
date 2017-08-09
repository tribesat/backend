""" Fake test file to set up testing
"""

import unittest

from tribesat.server import heartbeat


class TestServer(unittest.TestCase):
    """Server Tests
    """

    def test_heartbeat(self):
        """Test heartbeat"""
        response = heartbeat()
        expected = ';)'
        self.assertEqual(response, expected)
