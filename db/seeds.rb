User.create(name: "admin", email: "admin@gmail.com", 
password: "testtest",password_confirmation: "testtest", admin: true )

User.create(name: "not_admin", email: "notadmin@gmail.com", 
password: "testtest",password_confirmation: "testtest", id: 999 )

10.times do |n|
  User.create(name: "not_admin", email: "#{n+1}notadmin@gmail.com", 
              password: "testtest",password_confirmation: "testtest" )
end


User.all.each do |user|
  10.times do |n|
    user.tasks.create!(
      substance: "タイトル#{n+1}",
      content: 'テキストテキストテキストテキスト'
    )
  end
end

Label.create(phrase:"仕事")
Label.create(phrase:"家庭")
Label.create(phrase:"個人")
Label.create(phrase:"趣味")
Label.create(phrase:"必須")
Label.create(phrase:"可能ならば")
Label.create(phrase:"学校")
Label.create(phrase:"今日中")
Label.create(phrase:"今週中")
Label.create(phrase:"今月中")
