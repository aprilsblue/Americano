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

Chapter.create(title: "안드로이드란", ch_no: 1, user_id: 1, book_id: 1)
# Chapter.create(title: "안드로이드에 대한이해", ch_no: "1", user_id: "1", book_id: "1", chapter_id: "1")
Chapter.create(title: "개발 환경 구축하기", ch_no: "2", user_id: "1", book_id: "1")

ChapterConnection.create(superchapter_id: 1, subchapter_id: 2)

Quote.create(content: "안드로이드 7.0 누가버젼", user_id: 1, chapter_id: 1)
Quote.create(content: "소프트웨어 디자인 실패하는 첫 번째 원인은 디자인 자체가 부족하기 때문이다.", user_id: 1, chapter_id: 1)
Quote.create(content: "이 사실은 모든 객체 지향 언어에 적용될 수 있지만, 몇몇 언어에서는 그 정도가 훨씬 덜하다.", user_id: 1, chapter_id: 1)
Quote.create(content: "마지막으로, 디자인 작업과 프로그래밍 작업이 동떨어져 있을 때 디자인은 실패한다.", user_id: 1, chapter_id: 1)

Opinion.create(content: "안드로이드 7.0 누가버젼이 최신 버젼입니다.", category: "answer", user_id: 1, quote_id: 1)

Like.create(user_id: 1, opinion_id: 1)

Bookmark.create(reader_id: 1, book_id: 1, quote_id: 1)

puts("Seed Success!!")
