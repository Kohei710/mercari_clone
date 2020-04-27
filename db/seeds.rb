User.create!(
    name:  "Example User",
    email: "example@railstutorial.org",
    user_name: "example_user",
    password:              "foobar",
    password_confirmation: "foobar",
    admin:     true,
    activated: true,
    activated_at: Time.zone.now
)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
      name:  name,
      email: email,
      user_name: "user_name#{n}",
      password:              password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now
  )
end

users = User.order(:created_at).take(6)
image_path = File.join(Rails.root, "app/assets/images/kitten.jpg")
10.times do
  users.each do |user|
       user.items.create!(
        content: Faker::Lorem.sentence(5),
        picture: File.new(image_path),
        seller_area: rand(47),
        name: Faker::Lorem.word,
        price: rand(100..20000),
        category: rand(1..13),
        days_to_ship: rand(1..3),
        condition: rand(1..5),
        shipping_fee: rand(1..2)
    )
  end
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..10]
followers = users[3..7]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
