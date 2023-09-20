class User < ApplicationRecord
    has_many :bookmarks,foreign_key: 'bookmark_id' ,class_name: 'bookmark'
    has_many :tweets ,foreign_key: 'user_id',class_name: 'tweet'
    has_many :followers, foreign_key: 'follower_id', class_name: 'Follower'
    has_many :followings, foreign_key: 'following_id', class_name: 'Follower'
end
