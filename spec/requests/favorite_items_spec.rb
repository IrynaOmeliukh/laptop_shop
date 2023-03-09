require 'rails_helper'

RSpec.describe 'FavoriteItemsController', type: :request do
  describe 'GET #index' do
    it 'is successful' do
      get favorite_items_index_path

      expect(response).to render_template(:index)
      expect(response).to be_successful
    end
  end
end
