class AnimalsController < ApplicationController
  before_action :set_animals, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @animals = Animal.all
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { animal: animal }),
        image_url: helpers.asset_url("/app/assets/images/logo.png")
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal
    if @animal.save
      redirect_to animals_path, notice: "animal was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @animal
  end

  def update
    authorize @animal
    if @animal.update(animal_params)
      redirect_to root_path, notice: "animal was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @animal
    @animal.destroy
    redirect_to animals_path, notice: 'animal was successfully destroyed'
  end

  private

  def set_animals
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :specie, :description, :price, :origin, :stock, :address, images: [])
  end
end
