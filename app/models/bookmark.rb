class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # validates :movie, :list, presence: true
  validates :movie, uniqueness: { scope: :list, message: "this movie-list combination already exist" }

  validates :comment, length: { minimum: 6 }
end
