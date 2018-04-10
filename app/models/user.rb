class User < ApplicationRecord
  acts_as_voter

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"]
    end
  end
  # Note:  I should have used Devise instead of omniauth gem, I only used omniauth to learn it.
end
