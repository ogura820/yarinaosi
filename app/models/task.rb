class Task < ApplicationRecord
  validates :substance, presence: true
  validates :content, presence: true
  scope :search_by_substance, -> (serch_keyword){where('substance LIKE ?', "%#{serch_keyword}%")}
  scope :search_by_state_for_progress, -> (serch_progress){where(state_for_progress: serch_progress)}
end
