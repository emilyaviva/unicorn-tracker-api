require 'rails_helper'

RSpec.describe 'Unicorns API', type: :request do
  # initialize test data
  let!(:unicorns) { create_list(:unicorn, 5) }
  let(:unicorn_id) { unicorns.first.id }

  # Test suite for GET /unicorns
  describe 'GET /unicorns' do
    before { get '/unicorns' }

    it 'returns all unicorns' do
      expect(json).not_to be_empty
      expect(json.size).to eq 5
    end

    it 'returns status code 200' do
      expect(response).to have_http_status 200
    end
  end

  # Test suite for GET /unicorns/:id
  describe 'GET /unicorns/:id' do
    before { get "/unicorns/#{unicorn_id}" }

    context 'when the record exists' do
      it 'returns the unicorn' do
        expect(json).not_to be_empty
        expect(json['id']).to eq unicorn_id
      end

      it 'returns status code 200' do
        expect(response).to have_http_status 200
      end
    end

    context 'when the record does not exist' do
      let(:unicorn_id) { 9999 }

      it 'returns status code 404' do
        expect(response).to have_http_status 404
      end

      it 'returns a not found message' do
        expect(response.body).to match /Couldn't find Unicorn/
      end
    end
  end

  # Test suite for POST /unicorns
  describe 'POST /unicorns' do
    # valid payload
    let(:valid_attributes) do
      {
        name: 'New Unicorn Name',
        color: 'New Unicorn Color',
        food: 'New Unicorn Food',
        location: 'New Unicorn Location'
      }
    end

    context 'when the request is valid' do
      before { post '/unicorns', params: valid_attributes }

      it 'creates a unicorn' do
        expect(json['name']).to eq 'New Unicorn Name'
        expect(json['color']).to eq 'New Unicorn Color'
        expect(json['food']).to eq 'New Unicorn Food'
        expect(json['location']).to eq 'New Unicorn Location'
      end

      it 'returns status code 201' do
        expect(response).to have_http_status 201
      end
    end

    context 'when the request is invalid' do
      before { post '/unicorns', params: { this_will: 'fail' } }

      it 'returns status code 422' do
        expect(response).to have_http_status 422
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  # Test suite for PUT /unicorns/:id
  describe 'PUT /unicorns/:id' do
    let(:valid_attributes) do
      { name: 'Updated Unicorn Name' }
    end

    context 'when the record exists' do
      before { put "/unicorns/#{unicorn_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status 204
      end
    end
  end

  # Test suite for DELETE /unicorns/:id
  describe 'DELETE /unicorns/:id' do
    before { delete "/unicorns/#{unicorn_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status 204
    end
  end
end
