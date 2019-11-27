# frozen_string_literal: true

# Developer
class Developer < ApplicationRecord
  resourcify

  has_and_belongs_to_many :projects
  has_one_attached :avatar
  belongs_to :user
end
