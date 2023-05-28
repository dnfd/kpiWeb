class NotifierMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, &:text)
  end
end
