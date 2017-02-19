class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :description, presence: true
  has_many :posts
end
