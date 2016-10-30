class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader
  has_many :prototypes
  has_many :likes
  validates :email, :username, :member, :profile, :work, :image, presence: true
end
