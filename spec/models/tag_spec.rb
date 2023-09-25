require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "association" do 
     it { should belong_to(:hashtag) }
      it { should belong_to(:tweet) }  
  end
end
