class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images
  has_many :likes
  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
  validates :title, :catchcopy, :concept, :prototype_images, presence: true
  paginates_per 8
end
