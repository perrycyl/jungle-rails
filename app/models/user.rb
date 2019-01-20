class User < ActiveRecord::Base
    
    has_secure_password

    has_many :reviews
    
    validates :email, presence: true, uniqueness: true
    before_save :downcase_fields

    def downcase_fields
        self.email.downcase!
    end

end
