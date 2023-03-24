# Preview all emails at http://localhost:3000/rails/mailers/comparing_mailer
class ComparingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comparing_mailer/new_compare
  def new_compare
    laptops = Laptop.find((995..998).to_a)
    ComparingMailer.new_compare(laptops)
  end
end
