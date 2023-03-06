class LaptopsController < ApplicationController
  before_action :set_laptop, only: %i[ show edit update destroy ]

  # GET /laptops
  def index
    @laptops = Laptop.all
  end

  # GET /laptops/1
  def show
  end

  # GET /laptops/new
  def new
    @laptop = Laptop.new
  end

  # GET /laptops/1/edit
  def edit
  end

  # POST /laptops
  def create
    @laptop = Laptop.new(laptop_params)

    if @laptop.save
      redirect_to @laptop, notice: "Laptop was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /laptops/1
  def update
    if @laptop.update(laptop_params)
      redirect_to @laptop, notice: "Laptop was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /laptops/1
  def destroy
    @laptop.destroy
    redirect_to laptops_url, notice: "Laptop was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laptop
      @laptop = Laptop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laptop_params
      params.require(:laptop).permit(:company, :model, :year, :price)
    end
end
