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
    file = params[:package]
    filename = file.original_filename
    package_path = ENV['PACKAGE_PATH']
    package_path = "#{Rails.root}/#{package_path}/#{filename}"

    FileUtils.cp file.path, package_path

    respond_to do |f|
      f.json { render nothing: true }
    end
  end

  def update
  end

  def destroy
  end

  private

end
