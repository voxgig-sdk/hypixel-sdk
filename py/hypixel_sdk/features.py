# Hypixel SDK feature factory

from hypixel_sdk.feature.base_feature import HypixelBaseFeature
from hypixel_sdk.feature.test_feature import HypixelTestFeature


def _make_feature(name):
    features = {
        "base": lambda: HypixelBaseFeature(),
        "test": lambda: HypixelTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
