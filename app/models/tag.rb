class Tag < ApplicationRecord
    belongs_to :tweet, class_name: 'tweet'
end
