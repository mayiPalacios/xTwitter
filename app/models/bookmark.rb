class Bookmark < ApplicationRecord
  belongs_to :user #, foreign_key: 'user_id',class_name: 'user'
  belongs_to :tweet #, foreign_key: 'tweet_id', class_name: 'tweet'
end
