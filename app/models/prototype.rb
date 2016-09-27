class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images
end
