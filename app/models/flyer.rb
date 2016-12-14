class Flyer < ApplicationRecord
    
#    has_many :riders
    
    before_save { self.email = email.downcase }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    
    validates :password, length: {in:6..30}
    
    has_secure_password
    
    def self.search(search)
        where("firstname LIKE ? OR lastname LIKE ? ", "%#{search}%", "%#{search}%") 
    end
    
    
end
flyeradmin2017fearless