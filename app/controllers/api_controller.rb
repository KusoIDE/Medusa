class ApiController < ApplicationController
  respond_to :json

  private

  def with_package(pkg_name)
    package = Package.find_or_create_by(name: pkg_name)

    yield package
  ensure
    package.save
  end

  def bad_request msg: 'Wrong parameters'
    respond_to do |f|
      f.json { render json: { msg: msg }, stattus: :bad_request }
    end
  end

  def conflict
    render nothing: true, status: 409
  end

end
