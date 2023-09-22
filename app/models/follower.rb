class Follower < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :followee, class_name: "User"
  validate :unique_combination 


 scope :count_following,-> (user_id){
   where(following_id: user_id).count
 }

 scope :count_followee,-> (user_id){
  where(followee_id: user_id).count
}



 scope :create_sample_follower, -> {
  create([
    {  following_id: 1, followee_id: 3},
    {  following_id: 2, followee_id: 2},
    {  following_id: 3, followee_id: 4 },
    {  following_id: 5, followee_id: 4},
    { following_id: 6, followee_id: 5 },
    {  following_id: 7, followee_id: 1 },
    {  following_id: 5, followee_id: 2},
    { following_id: 2, followee_id: 3 },
    {  following_id: 4, followee_id: 2 },
    { following_id: 1, followee_id: 5 }
  ])
}

  private 

  def unique_combination
        if self.class.exists?(following: self.following, followee: self.followee)
              
          errors.add(:base, "you have already followed this person")
  
        end

      end
end
