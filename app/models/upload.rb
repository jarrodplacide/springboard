class Upload
  include ActiveModel::Model

  # Attributes
  attr_accessor :title, :file, :section_id, :return_url

  def initialize(attributes={})
    super
  end

end