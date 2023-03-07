class FavoriteLaptopsController < ApplicationController
  def index
    favorite_laptops
  end

  private

  def favorite_laptops
    @laptops = Laptop.where(like: true)
  end
end
