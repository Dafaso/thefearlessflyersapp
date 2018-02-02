class RidersController < ApplicationController

    def new
       @rider = Rider.new
    end

    def create
       @rider = Rider.new(rider_params)
        if @rider.save

            redirect_to '/static_pages/thanks'
        else
            render :new
        end
    end


    private

    def rider_params
        params.require(:rider).permit(:firstname, :lastname, :birthdate, :email, :phone, :address, :city, :school, :feet, :inches, :zip, :apt, :shirt, :ridebike, :physical, :actdesc, :whyjoin, :bikeexp, :athexp, :goal, :waiver)
    end


end
