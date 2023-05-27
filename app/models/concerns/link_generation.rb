module LinkGeneration
  extend ActiveSupport::Concern

  ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split('')

  included { after_create { update(short: generate_short_link) } }

  def generate_short_link = "http::/localhost:3000/#{short_from_int(id)}"

  def short_from_int(int)
    return ALPHABET[0] if int.zero?

    str = ''
    base = ALPHABET.length
    while int.positive?
      str << ALPHABET[int % base]
      int /= base
    end

    str
  end
end
