require 'rails_helper'

RSpec.describe Replie, type: :model do
 it { should belong_to(:user) }
 it { should belong_to(:tweet) }  
 it { should validate_length_of(:reply_text).is_at_most(255) }
 

end
