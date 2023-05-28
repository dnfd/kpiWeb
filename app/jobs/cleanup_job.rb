class CleanupJob < ApplicationJob
  queue_as :default

  def perform
    links_to_delete.each(&:destroy)
  end

  private

  def links_to_delete
    Link.where('created_at < ? ', Time.zone.today - 1.month)
        .select do |link|
          last_used = link.trackings.maximum(:created_at)
          next true unless last_used

          last_used < Time.zone.today - 1.month
        end
  end
end
