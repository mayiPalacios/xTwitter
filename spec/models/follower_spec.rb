require 'rails_helper'

RSpec.describe Follower, type: :model do
  it { should belong_to(:following).class_name('User') }
  it { should belong_to(:followee).class_name('User') }
end
