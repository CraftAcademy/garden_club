class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  attr_accessor :email_confirmation

  validates :name,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false}
  validates :email, presence: true,
                  # confirmation: true,
                  uniqueness: true,
                  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates_presence_of :email, presence: true, if: -> {check_email_conf?}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  # def check_email_conf?
  #   if @email == @email_confirmatiion
  #     true
  #   else
  #     false
  #   end
  # end

end
