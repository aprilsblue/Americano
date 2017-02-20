# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
User.create(email: "admin@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user1@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user2@test.com", password: "123412", password_confirmation: "123412")

Book.create(title: "Do It! 안드로이드 앱 프로그래밍", writer: "정재곤", publisher: "이지스퍼블리싱", published_at: "20170222", user_id: 1)
Book.create(title: "퍼펙트 루비 온 레일즈", writer: "야마다 요시히로", publisher: "제이펍", published_at: "20151230", user_id: 1)

Post.create(book_id: "1", content: "안드로이드 7.0 누가버젼이 최신 버젼입니다.", user_id: "1", page: "1")
Post.create(book_id: "1", content: "인텐트는 무엇인가" user_id: "2", page: "1")
Reply.create(post_id: "1", content: "정말로 최신 버젼인가요?", user_id: "2")



puts("Seed Success!!")
