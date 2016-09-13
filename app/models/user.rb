class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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

  # def check_email_conf?
  #   if @email == @email_confirmatiion
  #     true
  #   else
  #     false
  #   end
  # end

end
