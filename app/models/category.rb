# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  validates :name, uniqueness: true
  validates :route, uniqueness: true
  
  def to_param
    route
  end
end
