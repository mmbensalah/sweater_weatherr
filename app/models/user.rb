class User < ApplicationRecord
  has_many :favorites
  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
