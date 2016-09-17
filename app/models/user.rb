class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  attr_accessor :email_confirmation

  geocoded_by :full_address
  after_validation :geocode

  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20] #Devise is making up a password for a user registering with FB
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  private
  def full_address
    [g_street, g_street2, g_city, g_postcode, g_country].compact.join(', ')
  end

end
