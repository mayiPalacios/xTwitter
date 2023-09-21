class Follower < ApplicationRecord
  belongs_to :following_id, class_name: "User"
  belongs_to :followee_id, class_name: "User"
end
