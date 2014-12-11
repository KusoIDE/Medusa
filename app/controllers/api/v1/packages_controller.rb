class Api::V1::PackagesController < ApplicationController

  respond_to :html, :json

  def archive_contents
    @packages = Package.first
    #respond_with @packages
    respond_to do |format|
      format.html { render template: 'api/v1/packages/archive_contents' }
    end
  end

  def index
  end

  # POST /packages
  def create
    file = creation_params[:package]
    package_name = creation_params[:name]
    version = creation_params[:version]
    description = creation_params[:description]

    respond_to do |f|

      if file.nil? || package_name.nil? || version.nil?
        f.json { render json: { msg: 'Wrong parameters' }, stattus: :bad_request }
      else

        package_name = package_name.downcase

        filename, *ext = file.original_filename.split('.')

        package_path = ENV['PACKAGE_PATH'].downcase
        package_path = "#{Rails.root}/#{package_path}/#{package_name}"

        FileUtils.mkdir_p package_path

        package_path = "#{package_path}/#{filename}-#{version}.#{ext.join('.')}"

        FileUtils.cp file.path, package_path

        f.json { render nothing: true }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def creation_params
    params.permit(:name, :package, :version, :description)
  end
end
