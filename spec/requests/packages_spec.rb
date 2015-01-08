require 'rails_helper'

RSpec.describe 'Package API' do

  context 'V1' do
    context 'Packages list' do
      pending 'Complete this'
    end

    context 'Create new package' do

      [:name, :version, :description].each do |field|

        it "is not valid without #{field}" do
          params = attributes_for(:package_without_name)
          puts ">>>>> " , params
          post '/api/v1/packages', params

          expect(response.status).to eq(400)
          expect(response).to have_node(:errors)
        end
      end
    end
  end
end
