FactoryBot.define do
  factory :task do
    substance { 'test_substance' }
    content { 'test_content' }
    period { DateTime.new(2021, 8, 1, 10, 30) }
    state_for_progress { '未着手'}
  end
end