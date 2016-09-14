class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :email_confirmation

  validates :name,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false}
  validates :email, presence: true,
                  uniqueness: true,
                  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end
