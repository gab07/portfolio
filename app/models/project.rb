class Project < ApplicationRecord
  include Placeholder
  after_initialize :set_defaults

  validates_presence_of :title, :body, :main_image, :thumb_image

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

end
