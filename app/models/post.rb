class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category
end
