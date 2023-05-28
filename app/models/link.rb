class Link < ApplicationRecord
  include LinkGeneration

  BASE_URL = ENV.fetch('BASE_URL', 'http://127.0.0.1:3000')

  belongs_to :user
  has_many :trackings

  validates :full, presence: true, uniqueness: true,
                   format: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                   length: { maximum: 256 }
  validates :short, uniqueness: true, allow_blank: true, length: { maximum: 20 },
                    format: /\A\w+\z/

  def short_url = URI.join(BASE_URL, short)
end
