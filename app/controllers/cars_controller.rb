class CarsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  def index
    @cars = Car.order("created_at DESC").all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    binding.pry
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      binding.pry
      redirect_to cars, notice: 'New car was successfully created'
    else
      binding.pry
      render :new, notice: 'Could not create new car'
    end
  end
  def update
    if @car.update(car_params)
      redirect_to cars, notice: 'Car was successfully updated.'
    else
      render :edit, notice: 'Unable to update the car'
    end
  end
  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'car was successfully destroyed.'
  end
  private
    # Use callbacks to share common setup or constraints between actions.

    def authorize_user
      if !user_signed_in? || !current_user.admin?
        raise ActionController::RoutingError.new("Not Found")
      end
    end


    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:name, :description)
    end
end
