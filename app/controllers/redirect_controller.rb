class RedirectController < ApplicationController
  def index
    @link = Link.find_by(short: url)
    return head :not_found unless @link

    track
    notify_websocket

    redirect_to @link.full, status: 302, allow_other_host: true
  end

  private

  def url = params[:url]

  def track
    Tracking.create(
      link: @link,
      user: current_user, # nil if user not signed in
      ip: request.remote_ip,
      user_agent: request.headers['User-Agent']
    )
  end

  def notify_websocket
    user = current_user ? "User ###{current_user.id}" : 'Anonymous User'

    ActionCable.server.broadcast(
      "link.visited.#{@link.user_id}",
      { message: "#{user} clicked your link!", link_id: @link.id }
    )
  end
end
