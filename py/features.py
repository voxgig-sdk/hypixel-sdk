# Hypixel SDK feature factory

from feature.base_feature import HypixelBaseFeature
from feature.test_feature import HypixelTestFeature


def _make_feature(name):
    features = {
        "base": lambda: HypixelBaseFeature(),
        "test": lambda: HypixelTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
