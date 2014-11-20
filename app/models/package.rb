# This model represent an Emacs elpa compatible package
class Package

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :home_page,         default: ''
  field :documentation_url, default: ''
  field :download_url,      default: ''
  field :bug_tracker_url,   default: ''
  field :wiki_url,          default: ''
  field :source_code_url,   default: ''

  # Structure of this field is like:
  # {VERSION: DOWNLOADS, .... }
  field :versions,     type: Hash

  embeds_many :dependencies, class_name: 'PackageDependency'

  field :downloads, types: Integer, default: 0
  field :views,     types: Integer, default: 0

  has_and_belongs_to_many :authors, class_name: 'User', index: true

  index({ name: 1 }, { unique: true, background: true })


end
