class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # validates :movie, :list, presence: true
  validates :movie, uniqueness: { scope: :list, message: "already exist in this list" }

  validates :comment, length: { minimum: 6 }
end
