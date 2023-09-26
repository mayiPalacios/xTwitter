class Reply < ApplicationRecord
    belongs_to :user
    belongs_to :tweet
    validates :body, length: { maximum: 255 }
    validate :body_presence_in_replies 
    scope :create_sample_replies, -> {
        create([
          { body: "Ejemplo 1", tweet_id: 2, user_id: 1},
          { body: "Ejemplo 2", tweet_id: 8, user_id: 2},
          { body: "Ejemplo 3", tweet_id: 3, user_id: 3 },
          { body: "Ejemplo 4", tweet_id: 4, user_id: 4},
          { body: "Ejemplo 5", tweet_id: 6, user_id: 5 },
          { body: "Ejemplo 6", tweet_id: 7, user_id: 1 },
          { body: "Ejemplo 7", tweet_id: 4, user_id: 2},
          { body: "Ejemplo 8", tweet_id: 2, user_id: 3 },
          { body: "Ejemplo 9", tweet_id: 4, user_id: 4 },
          { body: "Ejemplo 10", tweet_id: 8, user_id: 5 }
        ])
      }
      

    private

    def body_presence_in_replies 
       if self.body.nil?
        self.errors.add(:body, "must contain content f0r reply") 
    end
end
end
