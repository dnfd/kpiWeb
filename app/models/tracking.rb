class Tracking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :link
end
