class User < ApplicationRecord
    has_many :bookmarks 
    has_many :tweets  
    has_many :followees, class_name: 'Follower', foreign_key: 'followee_id'
    has_many :replies
    has_many :followings, class_name: 'Follower', foreign_key: 'following_id'
    validates :email, uniqueness: true, presence: true
    validates :username, uniqueness: true , presence: true
    validates :password, presence: true
    validates :password, length: { minimum: 12 }
    validate :email_presence_in_user
    validate :username_presence_in_user
    validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@\/\*\-\+\_])[A-Za-z\d!@\/\*\-\+\_]{8,}\z/ , message: "invalid password"  }
    
# En tu modelo User.rb
scope :create_sample_users, -> {
    create([
      { 
        name: "Usuario 1",
        email: "usuario1@example.com",
        password: "Password123@",
        username: "user1",
        lastname: "Apellido1"
      },
      { 
        name: "Usuario 2",
        email: "usuario2@example.com",
        password: "Password123@",
        username: "user2",
        lastname: "Apellido2"
      },
      { 
        name: "Usuario 3",
        email: "usuario3@example.com",
        password: "Password123@",
        username: "user3",
        lastname: "Apellido3"
      },
      { 
        name: "Usuario 4",
        email: "usuario4@example.com",
        password: "Password123@",
        username: "user4",
        lastname: "Apellido4"
      },
      { 
        name: "Usuario 5",
        email: "usuario5@example.com",
        password: "Password123@",
        username: "user5",
        lastname: "Apellido5"
      },
      { 
        name: "Usuario 6",
        email: "usuario6@example.com",
        password: "Password123@",
        username: "user6",
        lastname: "Apellido6"
      },
      { 
        name: "Usuario 7",
        email: "usuario7@example.com",
        password: "Password123@",
        username: "user7",
        lastname: "Apellido7"
      },
      { 
        name: "Usuario 8",
        email: "usuario8@example.com",
        password: "Password123@",
        username: "user8",
        lastname: "Apellido8"
      },
      { 
        name: "Usuario 9",
        email: "usuario9@example.com",
        password: "Password123@",
        username: "user9",
        lastname: "Apellido9"
      },
      { 
        name: "Usuario 10",
        email: "usuario10@example.com",
        password: "Password123@",
        username: "user10",
        lastname: "Apellido10"
      }
    ])
  }
  
 

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
