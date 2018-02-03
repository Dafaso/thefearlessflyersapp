class FlyersController < ApplicationController

    before_action :require_flyer, only: [:index,:show,:edit,:update,:new]

    def index
        @riders = Rider.all.order("firstname")
        if !!(params[:search])

          @riders = @riders.select{|r|(r.firstname.downcase + " " + r.lastname.downcase).include?(params[:search].downcase)}

        end

        if params[:shirt].present?
          @riders = @riders.select{|rider| rider.shirt == params[:shirt]}
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

            redirect_to @rider
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
        params.require(:rider).permit(:firstname, :lastname, :birthdate, :email, :phone, :address, :city, :school, :feet, :inches, :zip, :apt, :shirt, :ridebike, :physical, :actdesc, :whyjoin, :bikeexp, :athexp, :goal, :password, :notes, :allergies, :health, :interview, :accepted )
    end

end
