require_relative 'user_constraint'

module RouteConstraints
  class AdminConstraint
    include RouteConstraints::UserConstraint

    def matches?(request)
      user = current_user(request)
      user.present? && user.admin?
    end
  end
end
