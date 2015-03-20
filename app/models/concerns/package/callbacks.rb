module Concerns::Package::Fields

  extends ActiveSupport::Concerns

  included do
    before_save :upload_file
  end

  def upload_file
  end
end
