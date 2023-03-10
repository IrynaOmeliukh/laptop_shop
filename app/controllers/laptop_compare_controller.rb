class LaptopCompareController < ApplicationController
  def index
    @laptops = load_comparing

    ComparingMailer.new_compare(@laptops).deliver_later
  end

  def render_pdf
    @laptops = load_comparing
    render pdf: "file_name", formats: [:html], stylesheets: ["application"],
           layout: 'pdf'   # Excluding ".pdf" extension.
  end
end
