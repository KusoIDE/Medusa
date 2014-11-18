class Package

  include Mongoid::Document
  include Mongoid::Timestamp

  field :name, type: String
  field :home_page, type: Url
  field :documents, type: Url
  field :versions, type: List
  field :dependencies, type: Hash
end
