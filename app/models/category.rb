# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
end
