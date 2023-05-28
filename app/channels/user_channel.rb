class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from("link.visited.#{current_user.id}")
    current_user.appear
  end

  def unsubscribed
    current_user.disappear
  end
end
