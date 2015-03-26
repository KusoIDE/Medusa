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
    Package.includes(:versions).all
  end

  # POST /packages
  def create
    req_params = OpenStruct.new creation_params

    return bad_request unless valid_package?(req_params.package)

    package = find_or_build_new_package(req_params)

    respond_to do |f|
      if package.save
        f.json { render nothing: true, status: :created, location: package }
      else
        f.json { render json: package.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:description)
    params.require(:owners)

    params.permit(:dependencies, :dev_dependencies, :home_page,
                  :documentation_url, :download_url, :bug_tracker_url,
                  :wiki_url, :source_code_url)

    params.permit(authors: [])

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

    dev_deps = req_params.dev_dependencies || []
    package.attributes = { version:      req_params.version,
                           description:  req_params.description,
                           package_data: req_params.package,
                           dependencies: req_params.dependencies || [],
                           development_dependencies: dev_deps,
                           home_page:          req_params.home_page,
                           documentation_url:  req_params.documentation_url,
                           download_url:       req_params.download_url,
                           bug_tracker_url:    req_params.bug_tracker_url,
                           wiki_url:           req_params.wiki_url,
                           source_code_url:    req_params.source_code_url,
                           authors:            req_params.authors,
                           owners:             req_params.owners }

    package
  end
end
