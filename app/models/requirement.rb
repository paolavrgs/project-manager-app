class Requirement < ApplicationRecord
  has_many_attached :requirement_files
  has_many :tasks, inverse_of: :requirement, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  belongs_to :project

  validates :title, :hours, presence: true

end
