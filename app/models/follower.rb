class Follower < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :followee, class_name: "User"
end
