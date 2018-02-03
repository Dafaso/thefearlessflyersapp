class RidersController < ApplicationController

    def new
       @rider = Rider.new
    end

    def create
      @rider = Rider.new(rider_params)
        if @rider.save

          RiderMailer.signup(@rider).deliver

          redirect_to thanks_path(@rider)
        else
          render :new
        end
    end


    private

    def rider_params
        params.require(:rider).permit(:firstname, :lastname, :birthdate, :email, :phone, :address, :city, :school, :feet, :inches, :zip, :apt, :shirt, :ridebike, :physical, :actdesc, :whyjoin, :bikeexp, :athexp, :goal, :waiver, :allergies, :health, :intervew, :accepted)
    end


end
