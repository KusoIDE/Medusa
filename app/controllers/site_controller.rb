class SiteController < ApplicationController
  def index
  end

  def packages
    @packages = Package.all
  end

  def package(id)

  end
end
