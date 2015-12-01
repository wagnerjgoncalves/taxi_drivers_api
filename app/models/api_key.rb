class APIKey < ActiveRecord::Base
  def self.generate
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless APIKey.exists?(key: token).any?
    end
  end
end
