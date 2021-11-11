class Submission < ApplicationRecord
  # mount_uploaders :image, ImageUploader

  validates :submission_comment, length: { maximum: 200 }

  belongs_to :user

  has_many :favorites, dependent: :destroy

  has_many :submission_images, dependent: :destroy
  accepts_attachments_for :submission_images, attachment: :image, append: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Submission.where(['submission_comment LIKE ?', "%#{search}%"])
    else
      Submission.none
    end
  end

  # FILE_NUMBER_LIMIT = 5

  # validate :validate_number_of_files

  # accepts_nested_attributes_for :

  # private

  # def validate_number_of_files
  #   return if images.length <= FILE_NUMBER_LIMIT
  #   errors.add(:images, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  # end
end
