class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation

  def current_user_subscribed?
    user_signed_in? && current_user.subscribed?
  end

  helper_method :current_user_subscribed?

  def remaining_days
    ((current_user.created_at + 3.days).to_date - Date.today).round
  end
  helper_method :remaining_days

  def trial_expired?
    remaining_days <= 0
  end
  helper_method :trial_expired?

  
  private

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password, :password_confirmation, :photo, :miniresume, :linkedin, :twitter, :facebook, :username, :website, :whatido, :achievements, :lookingfor, :investor])
  end
end
