require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:password).is_at_least(12) }
  it { should validate_format_of(:password).with(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@\/\*\-\+\_])[A-Za-z\d!@\/\*\-\+\_]{8,}\z/).with_message("invalid password")}
  it { should have_many(:tweets) } 
  it { should have_many(:bookmarks) } 
  it { should have_many(:replies) } 
  

end
