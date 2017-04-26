class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
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
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new
    end
  end
  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'car was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'car was successfully destroyed.'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:title, :description)
    end
end
