class AnimalsController < ApplicationController
  before_action :set_animals, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @animals = Animal.all
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    raise
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animal_path, notice: "animal was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to root_path, notice: "animal was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @animal.destroy
    redirect_to root_path, notice: 'animal was successfully destroyed'
  end

  private

  def set_animals
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :specie, :description, :price, :origin, :stock)
  end
end
