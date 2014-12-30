class Author
  include Mongoid::Document

  field :first_name
  field :last_name

  field :email,              type: String, default: ''
end
