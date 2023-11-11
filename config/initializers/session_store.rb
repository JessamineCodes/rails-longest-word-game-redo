# This line configures the cookie session
# cookies are the most lightweight option
# the key is a unique identifier we provide, so could be anything
Rails.application.config.session_store :cookie_store, key: 'game_session'
