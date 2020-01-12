class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session
  before_action :require_login

  helper_method :logged_in, :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in
    current_user.present?
  end

  def go_home
    redirect_to uploader_upload_url if logged_in
  end

  def require_login
    unless logged_in
      flash[:primary] = 'You need to be logged in to perform this action.'
      redirect_to root_url
    end
  end
end
