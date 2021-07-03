Lockbox.master_key = Rails.application.credentials.lockbox[:master_key]
Lockbox.default_options = { algorithm: "xsalsa20" }
