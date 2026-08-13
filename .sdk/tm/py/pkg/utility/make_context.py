# Hypixel SDK utility: make_context

from projectname_sdk.core.context import HypixelContext


def make_context_util(ctxmap, basectx):
    return HypixelContext(ctxmap, basectx)
