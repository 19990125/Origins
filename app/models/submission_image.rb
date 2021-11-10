class SubmissionImage < ApplicationRecord
  belongs_to :submission
  attachment :image
end
