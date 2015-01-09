require 'rails_helper'

RSpec.describe 'Package API' do

  context 'V1' do
    context 'Packages list' do
      pending 'Complete this'
    end

    context 'Create new package' do

      [:name, :version, :description, :package].each do |field|

        it "is not valid without #{field}" do
          params = attributes_for("package_without_#{field}".to_sym)
          post '/api/v1/packages', params

          expect(response.status).to eq(400)
          expect(response.body).to have_node(:errors)
        end
      end

      it 'respond with 409 (conflict) if same package exists' do
        package = create(:package)
        params = package.attributes_for

      end

    end
  end
end
