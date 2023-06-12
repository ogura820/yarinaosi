FactoryBot.define do
  factory :label do
    phrase { 'test_label1' }
  end

  factory :label2, class: Label do 
    phrase { 'test_label2' }
  end

  # factory :label3 do
  #   phrase { 'test_substance3' }
  # end
end
