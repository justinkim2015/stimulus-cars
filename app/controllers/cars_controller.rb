class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new
    @car.name = params[:car][:name]

    if @car.save
      @car.variants.create(variant_params[:variant])

      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.variants.build(variant_params[:variant]).save
      redirect_to car_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def variant_params
    params.require(:car).permit(variant: [:variant])
  end
end
