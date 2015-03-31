module Concerns::Package::Fields

  extend ActiveSupport::Concern

  included do
    field :name
    field :urlified_name
    field :description

    field :home_page,         default: ''
    field :documentation_url, default: ''
    field :download_url,      default: ''
    field :bug_tracker_url,   default: ''
    field :wiki_url,          default: ''
    field :source_code_url,   default: ''

    embeds_many :versions, class_name: 'PackageVersion'
    field :sorted_versions, type: Array

    field :downloads, type: Integer, default: 0
    field :views,     type: Integer, default: 0

    has_and_belongs_to_many :owners, class_name: 'User', index: true

    embeds_many :authors
  end
end
