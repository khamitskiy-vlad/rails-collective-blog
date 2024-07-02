# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', inverse_of: :posts
  has_many :comments, class_name: 'PostComment', dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 150 }
  validates :body, presence: true, length: { minimum: 150 }
end
