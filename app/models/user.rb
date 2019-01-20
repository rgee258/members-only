class User < ApplicationRecord

  before_create :remember

  has_secure_password

  class << self
    # Create a token
    def new_token
      SecureRandom.urlsafe_base64
    end

    # Convert to digest
    def digest(string)
      Digest::SHA1.hexdigest(string.to_s)
    end
  end

  def remember
    self.remember_token = User.digest(User.new_token)
  end
end
