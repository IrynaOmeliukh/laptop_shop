class LaptopCompareController < ApplicationController
  def index
    @laptops = load_comparing
  end
end
