require 'rails_helper'

RSpec.describe 'Package API' do

  before do
    @user = Fabricate(:user)
  end
  context 'V1' do
    context 'Packages list' do
      pending 'Complete this'
    end

    context 'Create new package' do

      [:name, :version, :description, :package].each do |field|

        it "is not valid without #{field}" do
          params = Fabricate.attributes_for("package_without_#{field}".to_sym)
          post '/api/v1/packages', params

          expect(response.status).to eq(400)
          expect(response.body).to have_node(:errors).including_text(field.to_s)
        end
      end

      it 'saves the package successfully in database' do
        params = Fabricate.attributes_for(:package_params)

        post '/api/v1/packages', params

        expect(response.status).to eq(201)
        package = Package.find_by(name: params[:name])
        expect(package).to_not be(nil)
      end

      it 'respond with 409 (conflict) if same package exists' do
        params = Fabricate.attributes_for(:package_params)

        post '/api/v1/packages', params
        post '/api/v1/packages', params

        expect(response.status).to eq(409)
      end
    end

    context 'getting a package' do
      it 'should return a json of a valid package.' do
        package = Fabricate(:stored_package)

        get "/api/v1/packages/#{package.urlified_name}"

        expect(response.status).to eq(200)
        expect(response.body).to have_node(:name).including_text(package.name)
      end

    end
  end
end
