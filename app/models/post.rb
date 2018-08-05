class Post < ApplicationRecord
  include VietnameseService
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments
  has_many :tags
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :cover, AvatarUploader
  CATEGORIES = %w(Techniques Life Japan)

  def normalize_friendly_id(string)
    normalized_string = normalize_with_hyphen(string)
    if (normalized_string =~ /[^0-9-]/).nil?
      string.parameterize
    else
      normalized_string
    end
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
