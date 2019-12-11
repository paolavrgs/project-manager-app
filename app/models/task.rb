class Task < ApplicationRecord
  belongs_to :requirement

  scope :by_created_at, -> { order('created_at ASC') }
  scope :completed, -> { where(status: true) }
end
