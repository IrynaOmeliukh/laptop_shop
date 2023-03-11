class LaptopCompareController < ApplicationController
  def index
    @laptops = load_comparing
  end

  def render_pdf
    @laptops = load_comparing

    render pdf: "file_name", formats: [:html], stylesheets: ["application"],
           layout: '_pdf'


    ComparingMailer.new_compare(@laptops).deliver_now
  end
end
