require 'rails_helper'

RSpec.describe Bookmark, type: :model do
       it { should belong_to(:user)}
       it { should belong_to(:tweet) }  
       describe 'bookmarked_tweets_by_user testing' do
          bookmark = Bookmark.bookmarked_tweets_by_user(2)
         expect(bookmark).to contain_exactly(2)  
              
       end

end
