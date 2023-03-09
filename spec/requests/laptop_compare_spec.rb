require 'rails_helper'

RSpec.describe 'LaptopCompareController', type: :request do
  describe 'GET #index' do
    it 'is successful' do
      get laptop_compare_index_path

      expect(response).to be_successful
    end
  end
end
