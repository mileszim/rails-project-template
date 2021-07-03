# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

def debug?
  !Rails.env.production?
end

Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: debug?, logger: (-> { Rails.logger }) do
  allow do
    origins "#{Rails.settings.dig(:domains, :default)}", "#{Rails.settings.dig(:domains, :app)}", "#{Rails.settings.dig(:domains, :localhost)}"

    resource "/ahoy/*",
      :headers => :any,
      :credentials => true,
      :methods => [:get, :post, :delete, :put, :patch, :options, :head],
      :max_age => 0

    # resource "*",
    #   :headers => :any,
    #   :methods => [:get, :post, :delete, :put, :patch, :options, :head],
    #   :max_age => 0
  end
end
