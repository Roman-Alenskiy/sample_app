class Micropost < ApplicationRecord

  mount_uploader :picture, PictureUploader

  # Associations
  belongs_to :user

  # Scopes
  default_scope -> {order(created_at: :desc)}

  # Validations 
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum:140}
  validate :picture_size

  # Private methods
  private

    # Validates the size of an uploaded picture
    def picture_size
      if picture.size > 10.megabytes
        errors.add(:picture, "should be less than 10MB")
      end
    end

end
