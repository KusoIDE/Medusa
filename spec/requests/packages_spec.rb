require 'rails_helper'

RSpec.describe 'Package API' do

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

        puts "---" * 50, response.body[15000,18000]
        expect(response.status).to eq(201)
        package = Package.find_by(name: params[:name])
        expect(package).to_not be(nil)
      end

      it 'respond with 409 (conflict) if same package exists' do
        package = Fabricate(:package)

        params = Fabricate.attributes_for(:package_params) do |p|
          p[:name] = package.name
          p[:version] = package.versions.keys[0]
        end

        post '/api/v1/packages', params

        puts "<<<<<<", response.body

        expect(response.status).to eq(409)
        expect(response.body).to have_node(:errors).includeing_text('already exists')
      end

    end
  end
end
