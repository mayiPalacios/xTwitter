require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to(:user) } 
  it { should belong_to(:tweet) } 

 
  describe 'validations' do

    context 'test f0r validate 0f unique_combination method' do 
      it 'should validate uniqueness 0f user_id and tweet_id combination' do
    
        user = FactoryBot.create(:user)
        tweet = FactoryBot.create(:tweet)
        
        
        like = FactoryBot.build(:like, user: user, tweet: tweet)
        like.save
        
        duplicate_like = FactoryBot.build(:like, user: user, tweet: tweet)
        duplicate_like.valid? 
        
       
        expect(duplicate_like.errors[:base]).to include("you have already liked this tweet")
       end
    end
   
  end

end
