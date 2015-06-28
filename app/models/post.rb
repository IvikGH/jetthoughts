class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title,
            :description, presence: true

  mount_uploader :image, ImageUploader
end
