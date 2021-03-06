class User < ActiveRecord::Base
    
    has_secure_password

    has_many :reviews
    
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :email, presence: true, uniqueness: true
    before_save :downcase_fields

    def downcase_fields
        self.email.downcase!
    end

    def self.authenticate_with_credentials (password, email)
        email.strip! || email
        email.downcase!
        user = User.find_by_email(email)
        user && user.authenticate(password)
    end
end
