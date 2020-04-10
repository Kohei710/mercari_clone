User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             user_name: "example_user",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               user_name: "user_name#{n}",
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
image_path = File.join(Rails.root, "app/assets/images/kitten.jpg")
50.times do
  content = Faker::Lorem.sentence(5)

  users.each { |user|
    user.items.create!(content: content,
        picture: File.new(image_path))}
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
