class LaptopsController < ApplicationController
  # GET /laptops
  def index
    @laptops = collection
  end

  # GET /laptops/1
  def show
    @laptop = resource
  end

  # GET /laptops/new
  def new
    @laptop = Laptop.new
  end

  # GET /laptops/1/edit
  def edit
    @laptop = resource
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
    @laptop = resource

    if @laptop.update(laptop_params)
      redirect_to @laptop, notice: "Laptop was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /laptops/1
  def destroy
    @laptop = resource

    @laptop.destroy
    redirect_to laptops_url, notice: "Laptop was successfully destroyed."
  end

  private

    def laptop_params
      params.require(:laptop).permit(:company, :model, :year, :price)
    end

    def collection
      Laptop.all
    end

    def resource
      collection.find(params[:id])
    end
end
