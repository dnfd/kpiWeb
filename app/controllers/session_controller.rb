class SessionController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
               &.authenticate(session_params[:password])

    return unauthorized unless user

    session[:user_id] = user.id
  end

  def destroy = (session[:user_id] = nil)

  private

  def session_params = params.permit(:email, :password)
end
