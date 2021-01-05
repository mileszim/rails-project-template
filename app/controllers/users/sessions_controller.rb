class Users::SessionsController < ApplicationController
  # layout 'login'
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = login(params[:email], params[:password], params[:remember])

    if @user
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:login_error] = 'Login Error: Invalid email or password'
      render action: 'new', status: 401
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end

  private

  def login_params
    params.permit(:email, :password, :remember)
  end
end
