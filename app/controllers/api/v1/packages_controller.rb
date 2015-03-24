require 'ostruct'

class Api::V1::PackagesController < ApiController

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
    req_params = OpenStruct.new creation_params

    return bad_request unless valid_package?(req_params.package)

    package = find_or_build_new_package(req_params)

    respond_to do |f|
      if package.save
        f.json { render nothing: true, status: :created }
      else
        f.json { render json: package.errors, status: :unprocessable_entity}
      end
    end
  end

    #package.dependencies = dependencies.map do |dep|
    #  PackageDependency.new(name: dep)
    #end

  def update
  end

  def destroy
  end

  private

  def creation_params
    params.require(:name)
    params.require(:package).permit(:filename, :data, :content_type)
    params.require(:version)
    params.permit(:dependencies)
    params.require(:description)
    params
  end

  def valid_package?(package)
    return false if package.nil?

    fn   = package[:filename].present?
    ct   = package[:content_type].present?
    data = package[:data].present?

    fn && ct && data
  end

  def find_or_build_new_package(req_params)
    package = Package.find_or_initialize_by(name: req_params.name)

    package.version_data      = req_params.version
    package.description       = req_params.description
    package.package_data      = req_params.package
    package.dependencies_data = req_params.dependencies

    package
  end
end
