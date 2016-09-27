class PrototypeImage < ActiveRecord::Base
  enum role: %i(main sub)
  belongs_to :prototype
end
