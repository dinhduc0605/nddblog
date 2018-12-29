# frozen_string_literal: true

# Model for Comment
class Comment < ApplicationRecord
  belongs_to :post
end
