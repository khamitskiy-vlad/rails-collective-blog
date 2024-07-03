# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user, inverse_of: :comments
  has_ancestry

  validates :content, presence: true, length: { maximum: 500 }
end
