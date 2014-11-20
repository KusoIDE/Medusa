# This model represent an Emacs elpa compatible package
class Package

  include Mongoid::Document
  include Mongoid::Timestamp

  field :name, type: String
  field :home_page, type: String
  field :documents, type: String
  field :versions, type: List
  field :dependencies, type: Hash
end
