class Tweet < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'user'
  has_many :likes
end
