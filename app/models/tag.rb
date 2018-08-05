class Tag < ApplicationRecord
  include VietnameseService
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :posts

  def normalize_friendly_id(string)
    "#{normalize_with_hyphen(string)}"
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
