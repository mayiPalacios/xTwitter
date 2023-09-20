class Tag < ApplicationRecord
    belongs_to :tweet, class_name: 'tweet'
    belongs_to :hashtag, class_name: 'hashtag'
end
