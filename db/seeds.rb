User.create(name: "admin", email: "admin@gmail.com", 
password: "testtest",password_confirmation: "testtest", admin: true )

User.create(name: "not_admin", email: "notadmin@gmail.com", 
password: "testtest",password_confirmation: "testtest", id: 999 )

User.all.each do |user|
  user.tasks.create!(
    substance: 'タイトル',
    content: 'テキストテキストテキストテキスト'
  )
end

