User.create(email: "admin@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user1@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user2@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user3@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user4@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user5@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user6@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user7@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user8@test.com", password: "123412", password_confirmation: "123412")



UserFriend.create([
  {follower_id: 1, followee_id: 3, status: "friend"},
  {follower_id: 1, followee_id: 4, status: "request"},
  {follower_id: 2, followee_id: 1, status: "request"},
  {follower_id: 4, followee_id: 3, status: "friend"},
  {follower_id: 7, followee_id: 5, status: "friend"},
  {follower_id: 6, followee_id: 2, status: "request"},
  {follower_id: 5, followee_id: 1, status: "request"}
])

Page.create([
  {url: "http://www.google.com"},
  {url: "http://www.naver.com"},
  {url: "http://www.daum.com"},
  {url: "http://www.snulife.com"},
  {url: "http://www.americano.com"},
  {url: "http://www.lib.snu.ac.kr"},
  {url: "http://www.snu.likelion.org"},
  {url: "http://www.google.com"}
])

Yeahap.create([
  {page_id: 1, user_id: 1, content: "hi", yeahapbox_id: 1},
  {page_id: 2, user_id: 1, content: "hi", yeahapbox_id: 1},
  {page_id: 3, user_id: 1, content: "hi", yeahapbox_id: 1},
  {page_id: 4, user_id: 1, content: "hi", yeahapbox_id: 1},
  {page_id: 1, user_id: 2, content: "hi", yeahapbox_id: 2},
  {page_id: 2, user_id: 2, content: "hi", yeahapbox_id: 2},
  {page_id: 3, user_id: 2, content: "hi", yeahapbox_id: 2},
  {page_id: 4, user_id: 2, content: "hi", yeahapbox_id: 2}
])

puts("Seed Success!!")

