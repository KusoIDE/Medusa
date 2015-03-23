module Concerns::Package::Validations
  extend ActiveSupport::Concern

  included do
    validate :unique_version

    #validate :valid_dependencies
    #validate :content_type
  end

  def unique_version
    if versions.include? version_data
      errors.add 'versions', 'Version already exists'
    end
  end
end
