require 'rails_helper'

RSpec.describe 'Package API' do

  let!(:json) {
    JSON.parse(response.body)
  }

  context 'V1' do
    context 'Packages list' do
      pending 'Complete this'
    end

    context 'Create new package' do
      it 'is not valid without name' do
        post '/api/v1/packages', {}

        expect(response.status).to eq(400)
        expect(json).to include?('errors')
      end
    end
  end
end
