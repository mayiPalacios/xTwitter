class Replie < ApplicationRecord
    belongs_to :user
    belongs_to :tweet
    validates :reply_text, length: { maximum: 255 }
    validate :body_presence_in_replies 
  
    private

    def body_presence_in_replies 
       if self.reply_text.nil?
        self.errors.add(:body, "must contain content f0r reply") 
    end
end
end
