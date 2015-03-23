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
    file = creation_params[:package]
    package_name = creation_params[:name]
    version = creation_params[:version]
    description = creation_params[:description]
    dependencies = creation_params[:dependencies]

    return bad_request if !valid_package?(package)

    package = Package.new(name: package_name, version_data: version,
                          description: description,
                          package_data: file,
                          dependencies_data: dependencies)

    #package.dependencies = dependencies.map do |dep|
    #  PackageDependency.new(name: dep)
    #end

    respond_to do |f|

        f.json { render nothing: true }
      end
    end
  end

  # PUT /packages
  def upload_file
    package_id = params[:package_id]
  end

  def update
  end

  def destroy
  end

  private

  def creation_params
    params.require(:name)
    params.require(:package).permit(:filename, :data, :content_type)
    params.require(:version)
    params.require(:dependencies)
    params.require(:description)
    params
  end

  def valid_package?(package)
    fn   = package[:filename].present?
    ct   = package[:content_type].present?
    data = package[:data].present?

    return false if p.nil
    return fn && ct && data
  end
end
