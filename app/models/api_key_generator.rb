module ApiKeyGenerator

  def self.new_key
    SecureRandom.hex
  end
end
