class FlyersController < ApplicationController
    
    before_action :require_flyer, only: [:index,:show,:edit,:update,:new]
    
    def index
        
        if params[:search] && params[:shirt]
            
            @riders = Rider.search(params[:search],params[:shirt]).order("firstname")

        elsif params[:search] || params[:shirt]
            if params[:search]
                params[:shirt]="" 
                @riders = Rider.search(params[:search],params[:shirt]).order("firstname")
            elsif params[:search]=""
                @riders = Rider.search(params[:search],params[:shirt]).order("firstname")  
            end
        else
            @riders = Rider.all.order("firstname")        
        end        
        
    end
    
    
    def new
       @rider = Rider.new 
    end
    
    def show
        @rider = Rider.find(params[:id])
    end
    
    
    def edit 
        @rider =Rider.find(params[:id])
    end
    
    def update
    @rider = Rider.find(params[:id])
        if @rider.update_attributes(rider_params)
            
            redirect_to '/flyers'
        else
            render 'edit'
        end
    end
    
    def create
       @rider = Rider.new(rider_params)
        if @rider.save
            
            redirect_to '/static_pages/thanks'
        else 
            render 'new'
        end
    end
    
    private
    
    def rider_params
        params.require(:rider).permit(:firstname, :lastname, :birthdate, :email, :phone, :address, :city, :school, :feet, :inches, :zip, :apt, :shirt, :ridebike, :physical, :actdesc, :whyjoin, :bikeexp, :athexp, :goal, :password)
    end
    
end
