require 'rails_helper'

RSpec.describe Reply, type: :model do
 it { should belong_to(:user) }
 it { should belong_to(:tweet) }  
 it { should validate_length_of(:body).is_at_most(255) }
 

end
