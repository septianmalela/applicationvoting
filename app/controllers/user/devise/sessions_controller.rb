# frozen_string_literal: true

class User::Devise::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  layout 'application_devise'
  before_action :check_active_user, only: :create
  before_action :set_user

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def set_user
    return if params[:user].blank?

    @check_user = User.find_by(email: params[:user][:email])
    flash[:alert] = 'Email Not Found!' if @check_user.blank?
  end

  def check_active_user
    @user = User.find_by(email: params[:user][:email])
    return if @user.blank?

    unless @user.active_user
      flash[:alert] = "Your account is not activated, Can't Log in to this website!"
      redirect_back fallback_location: :back
    end
  end
end
