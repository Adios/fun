# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fun_session',
  :secret      => 'afc377057bb7994a6cd1c65dae5a5fc5b34145144800e53763d6a47977ffc0fbf91e162e305b52a81ba0eb151673fb37366186756d60c7520ca2644dc86669d1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
