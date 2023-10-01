require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  it { should have_many(:tags) } 
end
