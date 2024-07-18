# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  def to_param
    route
  end
end
