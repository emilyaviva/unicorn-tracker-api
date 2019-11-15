require 'rails_helper'

RSpec.describe 'Unicorns API', type: :request do
  # initialize test data
  let!(:unicorns) { create_list(:unicorn, 5) }

  describe 'GET /unicorns' do
    before { get '/unicorns' }

    it 'returns all unicorns' do
      expect(json).not_to be_empty
      expect(json.size).to eq 5
    end

    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
