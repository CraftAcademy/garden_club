class Article < ApplicationRecord
  belongs_to :user
  validates :title, :body, :user_id, presence: true

  acts_as_taggable
  acts_as_taggable_on :skills, :interests
end
