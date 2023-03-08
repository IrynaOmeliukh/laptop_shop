class FavoriteItemsController < ApplicationController
  def index
    @laptops = load_favorites
  end
end
