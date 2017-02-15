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

Book.create(title: "Do It! 안드로이드 앱 프로그래밍", writer: "정재곤", publisher: "이지스퍼블리싱", published_at: "20170222", user_id: "1")
Book.create(title: "퍼펙트 루비 온 레일즈", writer: "야마다 요시히로", publisher: "제이펍", published_at: "20151230", user_id: "1")

Chapter.create(title: "안드로이드란", ch_no: "1", user_id: "1", book_id: "1")
# Chapter.create(title: "안드로이드에 대한이해", ch_no: "1", user_id: "1", book_id: "1", chapter_id: "1")
Chapter.create(title: "개발 환경 구축하기", ch_no: "2", user_id: "1", book_id: "1")

Quote.create(content: "안드로이드 7.0 누가버젼", user_id: "1", chapter_id: "1")

Opinion.create(content: "안드로이드 7.0 누가버젼", category: "answer", user_id: "1", quote_id: "1")

puts("시드 심기 성공")


