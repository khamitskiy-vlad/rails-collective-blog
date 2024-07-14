# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_count
  belongs_to :user, inverse_of: :comments, counter_cache: :comments_count
  has_ancestry

  validates :content, presence: true, length: { maximum: 500 }
end
