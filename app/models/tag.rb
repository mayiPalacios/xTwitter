class Tag < ApplicationRecord
    belongs_to :tweet 
    belongs_to :hashtag 

 
    def hashtag(hashtag_name)
      
        tags = self.hashtags()
     
        end
    


end
