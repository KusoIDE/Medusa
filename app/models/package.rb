# This model represent an Emacs elpa compatible package
class Package

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Document::Taggable

  include Concerns::Package::Fields
  include Concerns::Package::Callbacks
  include Concerns::Package::Validations

  # **package_data** accessor will contains data of the file to upload like
  # content type, base64 encoded data and file name
  #
  # **dependencies** is an array of current version dependencies. Each element
  # would be an array or [name, version]. version can be nil.
  #
  # **development_dependencies** is the same as **dependencies** but for
  # development.
  #
  # **version** contains the current version of the package to save.
  #
  # **_fs** is a temporary variable that will store the GridFS reference
  # object.
  #
  # **checksum** contains the SHA1 checksum of package content on create.
  attr_accessor(:package_data, :dependencies, :development_dependencies,
                :version, :_fs, :checksum)

  validates :name, presence: true

  index({ name: 1 }, { unique: true, background: true })
  index({ 'versions.version' => 1 }, { background: true })

  def package_data
    if !@package_data.kind_of? ActiveSupport::HashWithIndifferentAccess
      ActiveSupport::HashWithIndifferentAccess.new @package_data
    else
      @package_data
    end
  end

  def newer_version
    recent_version.version
  end

  def elispified_version(version = nil)
    version = newer_version if version.nil?

    version.gsub('.', ' ')
  end

  def have_dependencies?
    recent_version.have_dependencies?
  end

  def all_dependencies
    recent_version.all_dependencies
  end

  def is_tar?
    # TODO: don't use this lazy solution
    if recent_version.content_type == 'application/x-tar'
      true
    else
      false
    end
  end

  def keywords
    tags.join(' ')
  end

  def recent_version
    versions.where(version: sorted_versions.last).first
  end
end
