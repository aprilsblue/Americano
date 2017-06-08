Admin.create(email: "admin@yeahap.com", password: "12341234", password_confirmation: "12341234")
User.create(email: "test@test.com", password: "12341234", password_confirmation: "12341234", confirmed_at: "2016-05-05")

puts("Seed Success!!")
