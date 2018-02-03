class StaticPagesController < ApplicationController

  before_action :redirect_after_five_minutes, only:[:thanks]

  def index
  end

  def supporters
  end

  def youth
  end

  def board
  end

  def staff
  end

  def photos
  end

  def about
  end

  def apply
  end

  def thanks
    @rider = Rider.find(params[:rider])
    @age = (Time.now.year)-(@rider.birthdate.year)
    @age-=1 if (Time.now.month)<(@rider.birthdate.month)||(Time.now.month)==(@rider.birthdate.month)&&(Time.now.day)<(@rider.birthdate.day)
  end

  def waiver
  end

  private

  def redirect_after_five_minutes
    if Time.now > Rider.last.created_at + 360
      redirect_to '/'
    end
    false
  end

end
