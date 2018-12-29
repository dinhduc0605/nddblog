# frozen_string_literal: true

# Model for Post
class Post < ApplicationRecord
  include VietnameseService
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments
  has_many :tags
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags

  scope :published, -> {where(published: true)}

  validates :category_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :cover, AvatarUploader

  def normalize_friendly_id(string)
    normalized_string = normalize_with_hyphen(string)
    if (normalized_string =~ /[^0-9-]/).nil?
      string.parameterize
    else
      normalized_string
    end
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
