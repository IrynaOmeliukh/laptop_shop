require 'rails_helper'

RSpec.describe 'LaptopsController', type: :request do
  let(:query) { "iphone" }
  let!(:laptop) { Laptop.create(model: "IPhone Pro") }
  let(:other_laptop) { Laptop.create(model: "samsung x") }
  let(:new_laptop) do {
    laptop: {
      company: 'oppo',
      model: 'c5'
    }
  }
  end

  describe "GET #index" do

    before do
      allow(LaptopSearcher).to receive(:search).with(query).and_return([laptop])
    end

    it "returns matching laptops" do
      get laptops_path, params: { query: query }

      expect(response).to be_successful
      expect(assigns(:laptops)).to eq([laptop])
    end
  end

  describe 'GET :new' do
    it 'is successful' do
      get new_laptop_path

      expect(response).to be_successful
      expect(response).to render_template(:new)
      expect(assigns(:laptop)).to be_a_new(Laptop)
    end
  end

  describe 'GET :show' do
    it 'is successful' do
      get laptop_path(laptop.id)

      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include(laptop.model)
    end
  end

  describe 'GET :edit' do
    it 'is successful' do
      get edit_laptop_path(laptop)

      expect(response).to be_successful
      expect(response).to render_template(:edit)
      expect(assigns(:laptop)).to eq(laptop)
    end
  end

  describe 'POST :create' do
    it 'is successfull' do
      expect do
        post laptops_url, params: new_laptop
      end.to change(Laptop, :count).by(1)
      expect(response).to redirect_to(laptop_url(Laptop.last))
    end
  end

  describe 'PATCH :update' do
    it 'is successful' do
      put laptop_url(laptop), params: new_laptop
      laptop.reload

      expect(laptop.model).to eq('c5')
      expect(response).to redirect_to(laptop)
      expect(flash[:notice]).to eq('Laptop was successfully updated.')
    end
  end

  describe 'DELETE :destroy' do
    it 'is successful' do
      expect do
        delete laptop_url(laptop)
      end.to change(Laptop, :count).by(-1)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Laptop was successfully destroyed.')
    end

    it 'is not successful' do
      post add_to_favorites_path(laptop)
      delete laptop_url(laptop)
      expect(flash[:notice]).to eq('The laptop cannot be removed, it is in the favorites.')
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'POST :add_to_favorites' do
    it 'add laptop to session' do
      post add_to_favorites_path(laptop)

      expect(session[:favorites]).to match_array(laptop.id)
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELETE :remove_from_favorites' do
    it 'delete product from session' do
      post add_to_favorites_path(laptop)
      post add_to_favorites_path(other_laptop)
      delete remove_from_favorites_path(laptop)

      expect(session[:favorites]).not_to match_array(laptop.id)
      expect(session[:favorites]).to match_array(other_laptop.id)
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST :add_to_comparing' do
    it 'add laptop to session' do
      post add_to_comparing_path(laptop)

      expect(session[:comparing_laptops]).to match_array(laptop.id)
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELETE :remove_from_comparing' do
    it 'delete product from session' do
      post add_to_comparing_path(laptop)
      post add_to_comparing_path(other_laptop)
      delete remove_from_comparing_path(laptop)

      expect(session[:comparing_laptops]).not_to match_array(laptop.id)
      expect(session[:comparing_laptops]).to match_array(other_laptop.id)
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET :render_pdf" do
    it 'renders a PDF file' do
      get render_pdf_path
      expect(response).to be_successful
      expect(response.content_type).to eq 'application/pdf'
    end

    it "sends an email" do
      laptops = [laptop, other_laptop]
      allow(controller).to receive(:load_comparing).and_return(laptops)

      get render_pdf_path

      expect(ActionMailer::Base.deliveries.count).to eq(1)
      expect(ActionMailer::Base.deliveries.first.to).to eq(["iryna.omeliukh@gmail.com"])
      expect(ActionMailer::Base.deliveries.first.attachments.count).to eq(1)
      expect(ActionMailer::Base.deliveries.first.attachments.first.filename).to eq("compare.pdf")
    end
  end
end
