class Note < ApplicationRecord
  # destroys all responses to destroyed articles
  has_many :responses, dependent: :destroy
  # ensures that titles are at least 5 characters long
  validates :title, presence: true,
                    length: { minimum: 5}
end
