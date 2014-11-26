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

  def create
  end

  def update
  end

  def destroy
  end
end
