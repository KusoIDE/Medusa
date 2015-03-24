module Concerns::Package::Validations
  extend ActiveSupport::Concern

  included do
    validate :unique_version
    validate :valid_package_data, on: :create
    #validate :valid_dependencies
    #validate :content_type
  end

  def unique_version
    if versions.include? version_data
      errors.add :versions, 'Version already exists'
    end
  end

  def valid_package_data
    if package_data.nil? || package_data.empty?
      errors.add :package, 'Can not be nil or empty.'
      return false
    end

    fn   = package_data[:filename].present?
    ct   = package_data[:content_type].present?
    data = package_data[:data].present?

    if !(fn && ct && data)
      errors.add :package, "Should contains 'filename', 'data', 'content_type'"
    end
  end
end
