class Replie < ApplicationRecord
    belongs_to :user
    belongs_to :tweet
    validates :reply_text, length: { maximum: 255 }
    validate :body_presence_in_replies 
    scope :create_sample_replies, -> {
        create([
          { reply_text: "Ejemplo 1", tweet_id: 2, user_id: 1},
          { reply_text: "Ejemplo 2", tweet_id: 8, user_id: 2},
          { reply_text: "Ejemplo 3", tweet_id: 3, user_id: 3 },
          { reply_text: "Ejemplo 4", tweet_id: 4, user_id: 4},
          { reply_text: "Ejemplo 5", tweet_id: 6, user_id: 5 },
          { reply_text: "Ejemplo 6", tweet_id: 7, user_id: 1 },
          { reply_text: "Ejemplo 7", tweet_id: 4, user_id: 2},
          { reply_text: "Ejemplo 8", tweet_id: 2, user_id: 3 },
          { reply_text: "Ejemplo 9", tweet_id: 4, user_id: 4 },
          { reply_text: "Ejemplo 10", tweet_id: 8, user_id: 5 }
        ])
      }
      

    private

    def body_presence_in_replies 
       if self.reply_text.nil?
        self.errors.add(:reply_text, "must contain content f0r reply") 
    end
end
end
