class User < ApplicationRecord
    has_many :bookmarks #,foreign_key: 'bookmark_id' ,class_name: 'bookmark'
    has_many :tweets  #,foreign_key: 'user_id',class_name: 'tweet'
    has_many :followees, class_name: 'Follower', foreign_key: 'followee_id'
    has_many :replies
    has_many :followings, class_name: 'Follower', foreign_key: 'following_id'
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validate :password_presence_in_user
    validates :password, length: { minimum: 12 }
    validate :email_presence_in_user
    validate :username_presence_in_user
    validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@\/\*\-\+\_])[A-Za-z\d!@\/\*\-\+\_]{8,}\z/ , message: "invalid password"  }
    
    private 
    
    def email_presence_in_user
        if self.email.nil?
            self.errors.add(:email, "must contain content f0r user") 
        end
    end

    def username_presence_in_user
        if self.username.nil?
            self.errors.add(:username, "must contain content f0r user") 
        end
    end

    def password_presence_in_user
        if self.password.nil?
            self.errors.add(:password, "must contain content f0r user") 
        end
    end

end
