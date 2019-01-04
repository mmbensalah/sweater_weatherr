class User < ApplicationRecord
  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
