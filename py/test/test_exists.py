# ProjectName SDK exists test

import pytest
from hypixel_sdk import HypixelSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = HypixelSDK.test(None, None)
        assert testsdk is not None
