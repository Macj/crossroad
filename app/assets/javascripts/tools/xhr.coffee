# Dependency: reqwest.js

namespace "XHR", (exports) ->

  rails_mode = false

  exports.set_rails_mode = (mode) ->
    if "boolean" == mode
      rails_mode = mode
    else
      throw "XHR.rails_mode has to be boolean value."

  exports.post = (url, params_map, callback) ->
    #if rails_mode
    #  post_with_csrf url, params_map, callback
    #else
    post url, params_map, callback

  exports.post_and_expect_error = (url, params_map, success_callback, error_callback) ->
    reqwest
      url: url,
      type: 'json',
      method: 'post',
      headers: {
        "X-CSRF-Token": document.getElementsByName('csrf-token')[0].getAttribute('content')
      },
      data: params_map,
      success: success_callback,
      error: error_callback

  post_with_csrf = (url, params_map, callback) ->
    reqwest
      url: url,
      type: 'json',
      method: 'post',
      headers: {
        "X-CSRF-Token": document.getElementsByName('csrf-token')[0].getAttribute('content')
      },
      data: params_map,
      success: callback

  exports.post_with_csrf = post_with_csrf

  post = (url, params_map, callback) ->
    reqwest
      url: url,
      type: '[json,html]',
      method: 'post',
      headers: {
        "X-CSRF-Token": document.getElementsByName('csrf-token')[0].getAttribute('content')
      },
      data: params_map,
      success: callback

  get = (url, params_map, callback) ->
    reqwest
      url: url
      method: 'get',
      headers: {
        "X-CSRF-Token": document.getElementsByName('csrf-token')[0].getAttribute('content')
      },
      data: params_map
      success: callback

  exports.get = get

  fetch = (url, callback) ->
    reqwest url, callback

  exports.fetch = fetch
