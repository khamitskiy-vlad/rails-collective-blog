# frozen_string_literal: true

class Category < ApplicationRecord
  def to_param
    route
  end

  has_many :posts, dependent: :destroy
end
