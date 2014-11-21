class Api::V1::PackagesController < ApplicationController

  respond_to :plain

  def archive_contents
    @packages = Package.first
    respond_with @packages
    #respond_to do |format|
      #format.plain { render :archive_contents}
    #end
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
