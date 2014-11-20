# This model represent an Emacs elpa compatible package
class Package

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :home_page, type: String
  field :documents, type: String
  field :versions, type: Array
  field :dependencies, type: Hash
end
