# This document embeds on Package
class PackageDependency

  include Mongoid::Document

  field :version
  field :name

  embedded_in :package_version
end
