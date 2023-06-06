FactoryBot.define do
  factory :task do
    substance { 'test_substance' }
    content { 'test_content' }
    period { '1991-08-20 20:06:00' }
  end
end