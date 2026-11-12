class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 120 }
  validates :description, length: { maximum: 2_000 }
  validates :status, inclusion: { in: %w[active archived] }

  scope :recent, -> { order(updated_at: :desc) }
end
