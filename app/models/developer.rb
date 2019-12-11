# frozen_string_literal: true

# Developer
class Developer < ApplicationRecord
  resourcify

  has_and_belongs_to_many :projects
  has_one_attached :avatar
  belongs_to :user

  scope :by_availability, -> { all.sort { |a, b| b.progress <=> a.progress } }

  def reqs
    p_ids = projects.pluck(:id)
    Requirement.where(project_id: p_ids)
  end

  def tasks
    rqs = reqs.pluck(:id)
    Task.where(requirement_id: rqs)
  end

  def progress
    return 100 if tasks.size.zero?

    ((tasks.completed.size.to_f / tasks.size.to_f) * 100).round
  end
end
