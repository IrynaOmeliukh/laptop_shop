class LaptopCompareController < ApplicationController
  def index
    @laptops = load_comparing
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: 'laptop_compare/show',
        formats: [:html], stylesheets: ["application"], layout: 'pdf'   # Excluding ".pdf" extension.
      end
    end
  end
end
