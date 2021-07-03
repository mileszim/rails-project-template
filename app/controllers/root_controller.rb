class RootController < ApplicationController
  skip_before_action :require_login

  def index
    # Home
  end
end
