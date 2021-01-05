# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy
# @changeme
# Change to app assets and server domains/hosts
if Rails.env.production?
  Rails.application.config.content_security_policy do |policy|
    policy.default_src :self, :https, :unsafe_inline, "https://cdn.rails.project.template", "https://assets.rails.project.template"
    policy.font_src    :self, :https, :data, "https://cdn.rails.project.template", "https://assets.rails.project.template"
    policy.img_src     :self, :https, :data
    policy.object_src  :none
    policy.script_src  :self, :https, "'unsafe_inline'", "https://cdn.rails.project.template", "https://assets.rails.project.template"
    policy.style_src   :self, :https, "'inline'", "https://cdn.rails.project.template", "https://assets.rails.project.template"
    # If you are using webpack-dev-server then specify webpack-dev-server host
    policy.connect_src :self, :https, "http://localhost:3035", "ws://localhost:3035" if Rails.env.development?

    # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # If you are using UJS then enable automatic nonce generation
  Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
end

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
