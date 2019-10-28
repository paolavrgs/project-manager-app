class Requirement < ApplicationRecord
  has_many_attached :requirement_files
  has_many :tasks
  belongs_to :project

  validates :title, :hours, presence: true
end
