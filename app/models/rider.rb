class Rider < ApplicationRecord


    validates :firstname, :lastname, :birthdate, :phone, :city, :zip, :school, :feet, :inches, :shirt, :ridebike, :physical, presence: { :message => "required."}
    
    
    validates :whyjoin, presence: {:message => " Why Are You Interested...required."}
    validates :bikeexp, presence: {:message => " Bike Experience required."}
    validates :athexp, presence: {:message => " Athletic Experience required."}
    validates :goal, presence: {:message => " Personal Goal required."}
    
    before_save { self.email = email.downcase }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    
    def self.search(name,shirt)
        
        if name==""
            where(" shirt ~ ? ", shirt)
        elsif shirt==""   
            where("firstname ILIKE ? OR lastname ILIKE ?", "%#{name}%", "%#{name}%")
        else where("firstname ILIKE ? AND shirt ~ ?", "%#{name}%", shirt)
        end     
    end
    
    
end

#for heroku / postgres: 
#    LIKE => ILIKE 
#    IS => ~
