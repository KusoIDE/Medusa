class SiteController < ApplicationController
  def index
    packages = Package.all
    @counter = 0
    packages.each do |package|
      @counter += package.downloads
    end
  end

  def packages
    @packages = Package.all
  end

  def package(id)

  end
end
