class FlyersController < ApplicationController

    before_action :require_flyer, only: [:index,:show,:edit,:update,:new]

    def index
        @riders = Rider.all.sort_by{|r| [r.firstname.downcase, r.lastname.downcase]}
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

    def email
      @riders = Rider.all

      if params[:commit].present?

        if (params[:task])[0..2]=="All"
          @rides = @riders
        else
          @rides = @riders.select{ |v| (params[:task])[0..5] == "Reject" ? (v.accepted == false) : (v.accepted == true) }
        end

        if email_valid?
          if params[:test].present?
            RiderMailer.updates(current_flyer.firstname, params[:test_email], params[:subject], params[:body]).deliver_now
            flash.now[:notice] = "Test email sent to #{params[:test_email]}"
          else
            @rides.each do |rider|
              RiderMailer.updates(rider.firstname, rider.email, params[:subject], params[:body]).deliver_now
            end
            RiderMailer.updates("Dan-Flyer", "dafaso1@gmail.com", params[:subject], params[:body]).deliver_now

            flash.now[:notice] = "Email sent to #{@rides.length} riders."
          end
        end
      end

    end

    private

    def rider_params
        params.require(:rider).permit(:firstname, :lastname, :birthdate, :email, :phone, :address, :city, :school, :feet, :inches, :zip, :apt, :shirt, :ridebike, :physical, :actdesc, :whyjoin, :bikeexp, :athexp, :goal, :password, :notes, :allergies, :health, :interview, :accepted )
    end


    def email_valid?
      if params[:test].present? && params[:test_email].strip == ""
        flash[:notice] = "Make sure an email address is filled in for test email."
        return false
      end

      if params[:test_email].strip != "" && !(params[:test].present?)
        flash.now[:notice] = "Box must be checked for test email."
        return false
      end

      if params[:subject].strip == "" || params[:body].strip == ""
        flash.now[:notice] = "Both Subject and Body must have content."
        return false
      end

      if @rides.length == 0
        flash.now[:notice] = "There are no riders for this email."
        return false
      end
      true
    end

end
