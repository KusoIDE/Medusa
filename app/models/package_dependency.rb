# This document embeds on Package
class PackageDependency

  include Mongoid::Document

  field :version
  field :name

  field :depends_on, type: Hash

  embedded_in :package
end
