Admin.create(email: "admin@yeahap.com", password: "12341234", password_confirmation: "12341234")
User.create(email: "test@test.com", password: "12341234", password_confirmation: "12341234", confirmed_at: "2016-05-05")
User.create(email: "test1@test.com", password: "12341234", password_confirmation: "12341234", confirmed_at: "2016-05-05")

Page.create(url: "www.naver.com")
Page.create(url: "yeahp.com")
Page.create(url: "www.daum.net")
Page.create(url: "www.google.co.kr")
Page.create(url: "youtube.com")

Yeahap.create(content: "naver", user_id: 1, page_id: 1, yeahapbox_id: 1)
Yeahap.create(content: "yeahap", user_id: 1, page_id: 2, yeahapbox_id: 1)
Yeahap.create(content: "daum", user_id: 1, page_id: 3, yeahapbox_id: 1)
Yeahap.create(content: "youtube", user_id: 2, page_id: 5, yeahapbox_id: 2)
Yeahap.create(content: "google", user_id: 2, page_id: 4, yeahapbox_id: 2)
Yeahap.create(content: "daum", user_id: 2, page_id: 3, yeahapbox_id: 2)


puts("Seed Success!!")
