# frozen_string_literal: true

class User::Devise::ConfirmationsController < Devise::ConfirmationsController
  layout 'application_devise'
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  def show
    super do |resource|
      sign_in(resource)
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end

  private

  def after_confirmation_path_for(resource_name, resource)
    root_path
  end
end
