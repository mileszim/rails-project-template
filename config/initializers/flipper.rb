require "flipper/adapters/active_record"

# Flipper
Flipper.configure do |config|
  config.default do
    Flipper.new(Flipper::Adapters::ActiveRecord.new)
  end
end

Flipper.register(:superadmins) do |actor|
  actor.try(:is_superadmin?)
end

Flipper.register(:project_admins) do |actor|
  projects = actor.try(:projects) || []
  projects.any?{ |p| actor.try(:is_project_admin?, p) }
end

Flipper.register(:project_users) do |actor|
  projects = actor.try(:projects) || []
  projects.any?{ |p| actor.try(:is_project_user?, p) }
end

case Rails.env
when "production"
  banner_text = "Production Environment"
  banner_class = "danger"
when "staging"
  banner_text = "Staging Environment"
  banner_class = "warning"
else
  banner_text  = "Development Environment"
  banner_class = "info"
end

# ---

# Flipper UI
Flipper::UI.configure do |config|
  config.banner_text  = banner_text
  config.banner_class = banner_class
end

# # ---

# # This setup is primarily for first deployment, because consequently
# # we can add new features from the Web UI. However when the DB is changed/crashed
# # or in dev mode. This will immediately migrate the default features to be controlled.
# def setup_features(features)
#   features.each do |feature|
#     if Flipper[feature].exist?
#       return
#     end

#     # Disable feature by default
#     Flipper[feature].disable
#   end
# end

# # A list of features to be deployed on first push
# features = []

# if ENV[""] && ActiveRecord::Base.connection.data_source_exists?("flipper_features")
#   setup_features(features)
# end
