require 'rails_helper'

RSpec.describe Bookmark, type: :model do
       it { should belong_to(:user)}
       it { should belong_to(:tweet) }  
     
       describe 'scopes' do
       
              context "returns bookmarks by a specific user" do      
              it 'should returns bookmarks by a specific user' do
                     user = FactoryBot.create(:user) 
                     tweet = FactoryBot.create(:tweet)
                     tweet2 = FactoryBot.create(:tweet)
                     book = FactoryBot.create(:bookmark, user: user,tweet: tweet)
                     book2 = FactoryBot.create(:bookmark, user: user, tweet: tweet2)
                     other_bookmark = FactoryBot.create(:bookmark) 
               
                     bookmark_by_user = Bookmark.bookmarked_tweets_by_user(user.id)
               
                     expect(bookmark_by_user).to include(book, book2)
                     expect(bookmark_by_user).not_to include(other_bookmark)
                   end   
              end
        
        

       end

end


