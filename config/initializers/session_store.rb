# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_logotake_session',
  :secret      => 'a5be0e2dd2042bcb69b2e2051e7c4e0c858539f4b4bfa92a7b5f8ef1b218ff4f796946bf01e7f3ea829e6f7055f9b65c5934185831ab9993588f7e2df152de19'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
