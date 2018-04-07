class Post < ApplicationRecord
  has_many :comments
  has_many :tags
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :cover, AvatarUploader
  CATEGORIES = %w(Techniques Life Relax)
end
