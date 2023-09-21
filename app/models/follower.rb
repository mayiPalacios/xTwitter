class Follower < ApplicationRecord
  belongs_to :following_id, class_name: "follower"
  belongs_to :followee_id, class_name: "follower"
end
