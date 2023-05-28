class AdminChannel < ApplicationCable::Channel
  def subscribed
    reject unless current_user.admin?

    stream_from('admin.notification')
  end

  def unsubscribed; end
end
