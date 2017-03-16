User.create!([
  {email: "admin@test.com", encrypted_password: "$2a$11$ReTKKQeZKLHAFP7xxE9BNOVaecya6GEBfoWmQxQkjXaL2Sc2oTpQm", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-03-06 04:11:05", last_sign_in_at: "2017-03-03 08:14:40", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "user1@test.com", encrypted_password: "$2a$11$bmdqalKdgZvx8hJc2HhA4.vBgjiIa6.eHz8echjFJVM6rW5rFNaYK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {email: "user2@test.com", encrypted_password: "$2a$11$5zC2QbyMZriqif440GgjKegUjC4kf7I7LN84RkFdqdbTXvQBnyR3K", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil}
])
Book.create!([
  {title: "Do It! 안드로이드 앱 프로그래밍", writer: "정재곤", publisher: "이지스퍼블리싱", published_at: "2017-02-22 00:00:00", picture: "http://misc.ridibooks.com/cover/754018350/xxlarge", edition: nil, user_id: 1},
  {title: "퍼펙트 루비 온 레일즈", writer: "야마다 요시히로", publisher: "제이펍", published_at: "2015-12-30 00:00:00", picture: "http://cfile29.uf.tistory.com/image/2674A84156C7E7FB266073", edition: nil, user_id: 1},
  {title: "Introductioin to the Thermodynamics of Materials", writer: "David R Gaskell", publisher: "Taylor&Francis", published_at: "2008-12-01 00:00:00", picture: "https://images-na.ssl-images-amazon.com/images/I/41TmvLwafHL._SY344_BO1,204,203,200_.jpg", edition: nil, user_id: 1},
  {title: "알고리즘 중심의 머신러닝 가이드", writer: "스티븐 마슬랜드", publisher: "제이펍", published_at: "2016-12-28 00:00:00", picture: "http://preview.yes24.com/PreviewResize.aspx?no=34723305&fn=ofa0e0tkma1sslvh01.jpg&size=535%7C700", edition: nil, user_id: 1},
  {title: "필립 코틀러의 마켓 4.0", writer: "필립 코틀러", publisher: "길벗", published_at: "2017-02-17 00:00:00", picture: "http://image.yes24.com/momo/TopCate1069/MidCate003/106829951.jpg", edition: nil, user_id: 1}
])
Like.create!([
  {user_id: 2, post_id: 1},
  {user_id: 3, post_id: 2},
  {user_id: 1, post_id: 2},
  {user_id: 1, post_id: 1}
])
Post.create!([
  {content: "<h4>안드로이드 최신버전은?</h4>\r\n\r\n<p>안드로이드 7.0 누가버젼이 최신 버젼입니다!!!!!!!!!</p>\r\n", is_child: false, page: 1, user_id: 1, book_id: 1},
  {content: "<h4>인텐트</h4><p>인텐트는 무엇인가</p>", is_child: false, page: 1, user_id: 2, book_id: 1},
  {content: "<h4>인텐트</h4>\r\n\r\n<p>인텐트는 무엇인가!!!!!!!!!!!!!!</p>\r\n", is_child: true, page: 1, user_id: 1, book_id: 1}
])
PostPost.create!([
  {parent_id: 2, child_id: 3}
])
Reply.create!([
  {content: "<h4>진실</h4><p>정말로 최신 버젼인가요?</p>", post_id: 1, user_id: 2},
  {content: "what the", post_id: 1, user_id: 1}
])
