class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "Cannot be repeated by the same artist in the same year"}
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released do |song|
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    song.validates :release_year, presence: true
  end

end
