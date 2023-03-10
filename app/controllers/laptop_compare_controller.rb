class LaptopCompareController < ApplicationController
  def index
    @laptops = load_comparing
  end

  def render_pdf
    @laptops = load_comparing

    render pdf: "file_name", formats: [:html], stylesheets: ["application"],
           layout: '_pdf'   # Excluding ".pdf" extension.

    ComparingMailer.new_compare(@laptops).deliver_later
    flash[:info] = "Please check your email to activate your account."
    # redirect_to root_path, notice: 'Email sent successfully.'
  end
end

# def send_pdf_email
#   @laptops = load_comparing
# end
# html_string = render_to_string(partial: 'laptop_compare/table_for_comparing', locals:{laptops: @laptops})
# pdf_string = WickedPdf.new.pdf_from_string(html_string)
# ComparingMailer.send_pdf(pdf_string).deliver_now
