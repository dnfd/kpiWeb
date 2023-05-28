class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  def require_login = (unauthorized unless current_user)

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def unauthorized
    render json: { status: 401, message: 'Unauthorized.' }
  end

  def validate_record_owner
    unauthorized unless current_user.admin? || record_owner_id == current_user.id
  end
end
