Aws.config.update({
  credentials: Aws::Credentials.new(
    Rails.application.credentials.dig(:aws, :access_key_id),
    Rails.application.credentials.dig(:aws, :secret_access_key),
  ),
  region: ENV["AWS_REGION"] || Rails.application.credentials.dig(:aws, :default_region),
})
