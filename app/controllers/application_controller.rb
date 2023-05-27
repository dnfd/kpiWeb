class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  def require_login = (unauthorized unless current_user)

  def current_user
    @current_user ||= nil
  end

  def unauthorized
    render json: { status: 401, message: 'Unauthorized.' }
  end
end
