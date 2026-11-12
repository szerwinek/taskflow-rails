class Task < ApplicationRecord
  belongs_to :project

  STATUSES = %w[todo in_progress done].freeze
  PRIORITIES = %w[low medium high].freeze

  validates :title, presence: true, length: { maximum: 160 }
  validates :description, length: { maximum: 2_000 }
  validates :status, inclusion: { in: STATUSES }
  validates :priority, inclusion: { in: PRIORITIES }
  validate :due_date_cannot_be_in_the_past, if: -> { due_date.present? }

  scope :open_tasks, -> { where.not(status: "done") }

  def priority_label
    { "low" => "Niski", "medium" => "Średni", "high" => "Wysoki" }.fetch(priority, priority)
  end

  private

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "nie może być datą z przeszłości") if due_date < Date.current
  end
end
