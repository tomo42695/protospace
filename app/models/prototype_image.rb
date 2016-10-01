class PrototypeImage < ActiveRecord::Base
  enum role: %i(main sub)
  belongs_to :prototype
  mount_uploader :content, ImageUploader
end
