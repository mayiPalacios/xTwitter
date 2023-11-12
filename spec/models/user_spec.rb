require 'rails_helper'

RSpec.describe User, type: :model do
  it { should allow_value("Maria1233@jiji").for(:password) } 
  it { should have_many(:tweets) } 
  it { should have_many(:bookmarks) } 
  it { should have_many(:replies) } 
  it { should have_many(:followees).class_name('Follower').with_foreign_key('followee_id') }
  it { should have_many(:followings).class_name('Follower').with_foreign_key('following_id') }
  

end
