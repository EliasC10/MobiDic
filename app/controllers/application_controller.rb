# frozen_string_literal: true

class ApplicationController < ActionController::Base
  require 'jsonwebtoken'

  protected

  # Validates the token and supervisor and sets the @current_supervisor scope
  def authenticate_request!
    return invalid_authentication if !payload || !JsonWebToken.valid_payload(payload.first)

    load_current_supervisor!
    invalid_authentication unless @current_supervisor
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: { error: 'Invalid Request' }, status: :unauthorized
  end

  private

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue StandardError
    nil
  end

  # Sets the @current_supervisor with the supervisor_id from payload
  def load_current_supervisor!
    @current_supervisor = Supervisor.find_by(id: payload[0]['supervisor_id'])
  end
end
