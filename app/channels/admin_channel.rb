class AdminChannel < ApplicationCable::Channel
  def subscribed
    reject unless current_user.admin?

    stream_from('admin.notification')
    transmit({ users: User.online.map { |u| { online: u.online, id: u.id } } })
  end

  def unsubscribed; end
end
