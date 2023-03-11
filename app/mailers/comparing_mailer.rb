class ComparingMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_compare(laptop_compare)
    attachments["compare.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(partial: 'laptop_compare/table_for_comparing',
        locals:{laptops: laptop_compare}, layout: 'pdf', pdf: 'compare')
      )

    mail to: "iryna.omeliukh@gmail.com"
  end
end
