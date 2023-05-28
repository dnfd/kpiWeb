module LinkGeneration
  extend ActiveSupport::Concern

  ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split('')

  included do
    after_create do
      next if short.present?

      loop do
        # higher random range reduces collision chance, link would be ~7 chars long
        # short_from_int(1_999_999_999_999) => "hklIfnJ"
        nonce = SecureRandom.random_number * 1_000_000_000_000
        self.short = short_from_number(id + nonce.to_i)
        break unless Link.exists?(short:)
      end

      save!
    end
  end

  def short_from_number(int)
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
