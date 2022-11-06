class User < ApplicationRecord
    
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    # Validations 

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
     
    validates :password, presence: true

   

end
