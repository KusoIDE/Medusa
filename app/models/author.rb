class Author
  include Mongoid::Document

  field :first_name
  field :last_name

  field :email,              type: String, default: ''

  def name
    "#{first_name} #{last_name}"
  end
end
