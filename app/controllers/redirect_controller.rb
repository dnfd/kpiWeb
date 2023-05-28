class RedirectController < ApplicationController
  def index
    link = Link.find_by(short: url)
    return head :not_found unless link

    Tracking.create(
      link:,
      user: current_user, # nil if user not signed in
      ip: request.remote_ip,
      user_agent: request.headers['User-Agent']
    )

    redirect_to link.full, status: 302, allow_other_host: true
  end

  private

  def url = params[:url]
end
