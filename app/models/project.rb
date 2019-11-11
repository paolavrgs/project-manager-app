class Project < ApplicationRecord
  include AASM

  has_one_attached :logo_image
  has_many_attached :files
  has_many :requirements, inverse_of: :project
  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true
  has_and_belongs_to_many :developers

  def possible_transitions
    aasm.states(permitted: true).map(&:name)
  end

  aasm column: 'status' do
    state :planning, initial: true
    state :doing, :done, :iqc, :verify_client, :freeze

    event :to_freeze do
      transitions from: %i[planning doing iqc verify_client], to: :freeze
    end

    event :to_planning do
      transitions from: %i[freeze doing], to: :planning
    end

    event :to_doing do
      transitions from: %i[freeze planning], to: :doing
    end

    event :to_done do
      transitions from: %i[doing iqc verify_client], to: :done
    end

    event :to_iqc do
      transitions from: %i[planning doing], to: :iqc
    end

    event :to_verify_client do
      transitions from: %i[doing iqc], to: :verify_client
    end
  end
end
