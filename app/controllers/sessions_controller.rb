class SessionsController < ApplicationController
  skip_before_action :require_login

  def login
    if logged_in
      go_home
    end
  end

  def do_login
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      set_user_id
      redirect_to uploader_upload_url
    else
      flash[:danger] = 'login incorrect'
      redirect_to sessions_login_path
    end
  end

  def register
    if logged_in
      go_home
    end
  end

  def do_register
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {
          set_user_id

          flash[:success] = 'User was successfully created.'
          redirect_to uploader_upload_url
        }
      else
        format.js {
          flash.now[:danger] = @user.errors
          render partial: 'shared/flash_renderer'
        }
      end
    end
  end

  def logout
    session[:current_user_id] = nil
    reset_session
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def set_user_id
      session[:current_user_id] = @user.id
      flash[:success] = "Welcome"
    end
end
