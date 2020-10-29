class Recipe < ApplicationRecord
  
  belongs_to :user

  has_many :ingredients, :dependent => :destroy
  has_many :directions, :dependent => :destroy

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  validates :title, :description, :image, presence: true
  has_attached_file :image, styles: { medium: "400x400>" }, default_url: "/images/:style/missing.png", validate_media_type: false
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
