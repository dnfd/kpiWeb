class RedirectController < ApplicationController
  def index
    link = Link.find_by(short: url)
    return head :not_found unless link

    redirect_to link.full, status: 302, allow_other_host: true
  end

  private

  def url = params[:url]
end
