class ApiController < ApplicationController
  respond_to :json

  rescue_from(ActionController::ParameterMissing,
              with: :respond_with_bad_request)

  private

  def with_package(pkg_name)
    package = Package.find_or_create_by(name: pkg_name)
    yield package
    puts " <<<<<<<<<<<"
    package.save
  end

  def respond_with_bad_request(exception)
    msg = exception.message
    bad_request(msg: msg)
  end

  def bad_request(msg: 'Wrong argument')
    logger.warn "Bad request from '#{request.remote_ip}'"
    respond_to do |f|
      f.json { render json: { errors: msg }, status: :bad_request }
    end
  end

  def conflict
    render nothing: true, status: 409
  end

end
