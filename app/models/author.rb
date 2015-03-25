class Author
  include Mongoid::Document

  field :first_name
  field :last_name

  field :email, type: String, default: ''

  embedded_in :package

  def name
    "#{first_name} #{last_name}"
  end
end
