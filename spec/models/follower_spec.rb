require 'rails_helper'

RSpec.describe Follower, type: :model do
  it { should belong_to(:following).class_name('User') }
  it { should belong_to(:followee).class_name('User') }
 
  describe 'validations' do
 it 'validates uniqueness of following and followee combination' do

  user = FactoryBot.create(:user)
  
  user2 = FactoryBot.create(:user)
   

  follow = FactoryBot.build(:follower, following: user,followee: user2)
  follow.save

  duplicate_follow = FactoryBot.build(:follower,following: user,followee: user2)
  duplicate_follow.valid? 

  expect(duplicate_follow.errors[:base]).to include("you have already followed this person")
  


    end

end

  describe 'scopes' do
   
    it 'counts the number of following for a specific user' do
    
      user = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      user3 = FactoryBot.create(:user)
     
      FactoryBot.create(:follower, following_id: user.id, followee_id: user2.id)
      FactoryBot.create(:follower, following_id: user.id, followee_id: user3.id)
      
   
      FactoryBot.create(:follower, following_id: user2.id,followee_id: user3.id)
      
     
      count = Follower.count_following(user.id)
      
    
      expect(count).to eq(2)
    end
  
    it 'counts the number of followee for a specific user' do
      user = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      user3 = FactoryBot.create(:user)
     
      FactoryBot.create(:follower, following_id: user3.id, followee_id: user2.id)
      FactoryBot.create(:follower, following_id: user.id, followee_id: user2.id)
      
   
      FactoryBot.create(:follower, following_id: user2.id,followee_id: user3.id)
      
     
      count = Follower.count_followee(user2.id)
      
    
      expect(count).to eq(2)

       

    end
  end




end
