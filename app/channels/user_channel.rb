class UserChannel < ApplicationCable::Channel
  def subscribed = stream_from("link.visited.#{current_user.id}")

  def unsubscribed; end
end
