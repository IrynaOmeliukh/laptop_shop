require "rails_helper"

RSpec.describe ComparingMailer, type: :mailer do
  describe ':new_compare' do
    let(:laptop1) { Laptop.create(model: 'Dell XPS', price: 1000) }
    let(:laptop2) { Laptop.create(model: 'MacBook Pro', price: 1500) }
    let(:laptop_compare) { [laptop1, laptop2] }

    it 'sends an email with the comparison table' do
      email = ComparingMailer.new_compare(laptop_compare).deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(1)
      expect(email.to).to eq(['iryna.omeliukh@gmail.com'])
      expect(email.subject).to eq('Laptop Comparison')
      expect(email.attachments.count).to eq(1)
      expect(email.attachments.first.filename).to eq('compare.pdf')
    end
  end
end
