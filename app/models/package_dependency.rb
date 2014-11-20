# This document embeds on Package
class PackageDependency

  include Mongoid::Document

  field :version

  field :depends_on, type: Hash

  embedded_in :package
end
