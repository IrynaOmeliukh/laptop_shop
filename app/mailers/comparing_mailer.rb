class ComparingMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_compare(laptop_compare)
    puts '-----------------sending------------------'
    attachments["compare.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(partial: 'laptop_compare/table_for_comparing',
        locals:{laptops: laptop_compare}, layout: 'pdf', pdf: 'compare')
      )
      @url  = 'http://www.gmail.com'
      # binding.pry
    # @greeting = 'hello'
    mail to: "ihormruchko666@gmail.com"

  end
end

# def send_pdf(pdf_string)
#   attachments['example.pdf'] = pdf_string
#   mail(to: 'iryna.omeliukh@gmail.com', subject: 'PDF Example')
# end
