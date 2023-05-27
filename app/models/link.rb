class Link < ApplicationRecord
  include LinkGeneration

  belongs_to :user

  validates :full, presence: true, uniqueness: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
