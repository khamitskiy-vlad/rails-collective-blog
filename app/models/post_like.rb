# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :user, counter_cache: :likes_count
  belongs_to :post, counter_cache: :likes_count
end
