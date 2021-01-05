Lockbox.master_key = ENV["KMS_KEY_ID"] || Rails.application.credentials.lockbox[:master_key]
Lockbox.default_options = { algorithm: "xsalsa20" }
