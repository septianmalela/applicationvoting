class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_homes_path    
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if params[:from_user]
      new_user_session_path
    end
  end
end
