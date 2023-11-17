# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully', data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: 'User could not be created successfull', errors: resource.errors.full_messages }, status: :unprocessable_entity
      }
    end
  end
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
