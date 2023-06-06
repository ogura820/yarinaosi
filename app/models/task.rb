class Task < ApplicationRecord
  validates :substance, presence: true
  validates :content, presence: true
end
