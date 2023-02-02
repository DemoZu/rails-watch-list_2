# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :bookmarks
  # before_destroy :checks
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :overview, presence: true
end
