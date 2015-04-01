module Concerns::Package::Validations
  extend ActiveSupport::Concern

  included do
    validate :unique_version
    validate :valid_package_data
    validate :base64_format, on: :create
    validate :validate_dependencies
    #validate :content_type
  end

  def unique_version
    if !new_record? && version
      if versions.where(version: version).exists?
        errors.add :versions, 'Version already exists'
      end
    end
  end

  def valid_package_data
    return true if !package_data.present? && version.nil? && !new_record?

    if !package_data.present? && new_record?
      errors.add :package, 'Can not be nil or empty.'
      return false
    end

    fn   = package_data['filename'].present?
    ct   = package_data['content_type'].present?
    data = package_data['data'].present?

    if !(fn && ct && data)
      errors.add :package, "Should contains 'filename', 'data', 'content_type'"
    end

    if version.nil?
      errors.add :version, '"version" is needed when "package_data" presents.'
    end
  end

  def base64_format
    base64_part = package_data['data'].split(',')[-1]

    begin
      @cached_content = Base64.strict_decode64(base64_part)
    rescue ArgumentError
      errors.add :package, 'Invalid base64'
    end
  end

  def validate_dependencies
    if dependencies.present? && !dependencies.kind_of?(Hash)
      errors.add :dependencies, 'must be a hash.'
    end

    if development_dependencies.present? && \
      !development_dependencies.kind_of?(Hash)
      errors.add :development_dependencies, 'must be a hash'
    end
  end
end
