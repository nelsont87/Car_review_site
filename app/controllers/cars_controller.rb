class CarsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  def index
    @cars = Car.order("created_at DESC").all
  end

  def show
    @car = Car.find(params[:id])
    @user = @car.user
    @reviews = @car.reviews
    @review = @car.reviews.build
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to @car, notice: 'New car was successfully created'
    else
      render :new, notice: 'Could not create new car'
    end
  end
  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render :edit, notice: 'Unable to update the car'
    end
  end
  def destroy
    @car = Car.find(params[:id])
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
