class UserMailer < ApplicationMailer
  default from: Rails.settings.dig(:email, :default)

  def activation_needed_email(user)
    @user = user
  end

  def activation_success_email(user)
    @user = user
  end

  def reset_password_email(user)
    @user = user
  end

  def send_unlock_token_email(user)
    @user = user
  end
end
