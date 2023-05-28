class Link < ApplicationRecord
  include LinkGeneration

  belongs_to :user

  validates :full, presence: true, uniqueness: true,
                   format: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                   length: { maximum: 256 }
  validates :short, uniqueness: true, allow_blank: true, length: { maximum: 20 },
                    format: /$[a-zA-Z0-9]+^/
end
