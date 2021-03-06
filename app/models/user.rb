class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :orders

  enum role: {
    admin: 0,
    user: 1
  }
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        username: data['name'].split(' ').first,
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
