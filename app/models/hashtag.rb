class Hashtag < ApplicationRecord
    has_many :tags
    validate :hashtag_name_presence 

    private 

    def hashtag_name_presence
        if self.hashtag_name.nil?
            self.errors.add(:hashtag_name, "must contain content f0r hashtag") 
        end

    end
 

end
