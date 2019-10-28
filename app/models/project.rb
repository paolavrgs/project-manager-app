class Project < ApplicationRecord
  has_one_attached :logo_image
  has_many_attached :files
  has_many :requirements, inverse_of: :project
  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true
  has_and_belongs_to_many :developers
end
