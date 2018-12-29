# frozen_string_literal: true

# Model for Tag
class Tag < ApplicationRecord
  include VietnameseService
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :posts

  def normalize_friendly_id(string)
    normalized_string = normalize_with_hyphen(string)
    if (normalized_string =~ /[^0-9-]/).nil?
      string.parameterize
    else
      normalized_string
    end
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
