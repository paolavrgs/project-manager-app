class Project < ApplicationRecord
  has_one_attached :logo_image
  has_many_attached :files
end
