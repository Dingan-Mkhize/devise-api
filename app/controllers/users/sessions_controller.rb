# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

    before_action :authenticate_user!, only: :destroy


  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?

    render json: {
      status: { code: 200, message: "User signed in successfully", data: current_user }
    }, status: :ok
  end

  private

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: "Signed out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "User has no active session"
      }, status: :unauthorized
    end
  end
end

