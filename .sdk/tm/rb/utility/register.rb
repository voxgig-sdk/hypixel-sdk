# Hypixel SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

HypixelUtility.registrar = ->(u) {
  u.clean = HypixelUtilities::Clean
  u.done = HypixelUtilities::Done
  u.make_error = HypixelUtilities::MakeError
  u.feature_add = HypixelUtilities::FeatureAdd
  u.feature_hook = HypixelUtilities::FeatureHook
  u.feature_init = HypixelUtilities::FeatureInit
  u.fetcher = HypixelUtilities::Fetcher
  u.make_fetch_def = HypixelUtilities::MakeFetchDef
  u.make_context = HypixelUtilities::MakeContext
  u.make_options = HypixelUtilities::MakeOptions
  u.make_request = HypixelUtilities::MakeRequest
  u.make_response = HypixelUtilities::MakeResponse
  u.make_result = HypixelUtilities::MakeResult
  u.make_point = HypixelUtilities::MakePoint
  u.make_spec = HypixelUtilities::MakeSpec
  u.make_url = HypixelUtilities::MakeUrl
  u.param = HypixelUtilities::Param
  u.prepare_auth = HypixelUtilities::PrepareAuth
  u.prepare_body = HypixelUtilities::PrepareBody
  u.prepare_headers = HypixelUtilities::PrepareHeaders
  u.prepare_method = HypixelUtilities::PrepareMethod
  u.prepare_params = HypixelUtilities::PrepareParams
  u.prepare_path = HypixelUtilities::PreparePath
  u.prepare_query = HypixelUtilities::PrepareQuery
  u.result_basic = HypixelUtilities::ResultBasic
  u.result_body = HypixelUtilities::ResultBody
  u.result_headers = HypixelUtilities::ResultHeaders
  u.transform_request = HypixelUtilities::TransformRequest
  u.transform_response = HypixelUtilities::TransformResponse
}
