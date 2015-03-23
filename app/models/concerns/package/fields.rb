module Concerns::Package::Fields

  extend ActiveSupport::Concern

  included do
    field :name
    field :description

    field :home_page,         default: ''
    field :documentation_url, default: ''
    field :download_url,      default: ''
    field :bug_tracker_url,   default: ''
    field :wiki_url,          default: ''
    field :source_code_url,   default: ''

    field :upload_hash,       default: ''
    # Structure of this field is like:
    # {VERSION: DOWNLOADS, .... }
    field :versions, type: Hash, default: {}
    # Structure of this field is like:
    # {VERSION: PACKAGE_PATH, .... }
    field :packages, type: Hash, default: {}

    embeds_many :dependencies, class_name: 'PackageDependency'
    embeds_many :development_dependencies, class_name: 'PackageDependency'

    field :downloads, type: Integer, default: 0
    field :views,     type: Integer, default: 0

    has_and_belongs_to_many :owners, class_name: 'User', index: true

    embeds_many :authors
  end
end
