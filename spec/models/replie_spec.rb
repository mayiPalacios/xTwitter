require 'rails_helper'

RSpec.describe Replie, type: :model do
 it { should belong_to(:user) }
 it { should belong_to(:tweet) }  
end
