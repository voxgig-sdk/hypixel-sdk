<?php
declare(strict_types=1);

// Hypixel SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

HypixelUtility::setRegistrar(function (HypixelUtility $u): void {
    $u->clean = [HypixelClean::class, 'call'];
    $u->done = [HypixelDone::class, 'call'];
    $u->make_error = [HypixelMakeError::class, 'call'];
    $u->feature_add = [HypixelFeatureAdd::class, 'call'];
    $u->feature_hook = [HypixelFeatureHook::class, 'call'];
    $u->feature_init = [HypixelFeatureInit::class, 'call'];
    $u->fetcher = [HypixelFetcher::class, 'call'];
    $u->make_fetch_def = [HypixelMakeFetchDef::class, 'call'];
    $u->make_context = [HypixelMakeContext::class, 'call'];
    $u->make_options = [HypixelMakeOptions::class, 'call'];
    $u->make_request = [HypixelMakeRequest::class, 'call'];
    $u->make_response = [HypixelMakeResponse::class, 'call'];
    $u->make_result = [HypixelMakeResult::class, 'call'];
    $u->make_point = [HypixelMakePoint::class, 'call'];
    $u->make_spec = [HypixelMakeSpec::class, 'call'];
    $u->make_url = [HypixelMakeUrl::class, 'call'];
    $u->param = [HypixelParam::class, 'call'];
    $u->prepare_auth = [HypixelPrepareAuth::class, 'call'];
    $u->prepare_body = [HypixelPrepareBody::class, 'call'];
    $u->prepare_headers = [HypixelPrepareHeaders::class, 'call'];
    $u->prepare_method = [HypixelPrepareMethod::class, 'call'];
    $u->prepare_params = [HypixelPrepareParams::class, 'call'];
    $u->prepare_path = [HypixelPreparePath::class, 'call'];
    $u->prepare_query = [HypixelPrepareQuery::class, 'call'];
    $u->result_basic = [HypixelResultBasic::class, 'call'];
    $u->result_body = [HypixelResultBody::class, 'call'];
    $u->result_headers = [HypixelResultHeaders::class, 'call'];
    $u->transform_request = [HypixelTransformRequest::class, 'call'];
    $u->transform_response = [HypixelTransformResponse::class, 'call'];
});
