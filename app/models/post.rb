class Post < ApplicationRecord
  has_many :comments
  has_many :tags
  belongs_to :user
  has_and_belongs_to_many :tags
end
