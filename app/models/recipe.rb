class Recipe < ApplicationRecord
  has_attached_file :image, styles: { medium: "400x400>" }, default_url: "/images/:style/missing.png", validate_media_type: false
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
