class ApplicationController < ActionController::Base
  include ApplicationHelper

  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_redirect

  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_homes_path
    elsif admin_signed_in?
      admin_homes_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if params[:from_user]
      new_user_session_path
    end
  end

  protected

  def set_redirect
    if params[:controller].eql?("devise/registrations") && params[:action].eql?('new')
      flash[:alert] = "Can't Access This Page!!!"
      redirect_to new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :full_name,
                                                       :npm, :avatar])
  end
end
