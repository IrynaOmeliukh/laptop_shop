class LaptopCompareController < ApplicationController
  def index
    @laptops = load_comparing
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: 'laptop_compare/pdf', formats: [:html]   # Excluding ".pdf" extension.
      end
    end
  end
end
