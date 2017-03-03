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

Book.create(title: "Do It! 안드로이드 앱 프로그래밍", writer: "정재곤", publisher: "이지스퍼블리싱", published_at: "20170222", user_id: 1, picture: "http://misc.ridibooks.com/cover/754018350/xxlarge")
Book.create(title: "퍼펙트 루비 온 레일즈", writer: "야마다 요시히로", publisher: "제이펍", published_at: "20151230", user_id: 1, picture: "http://cfile29.uf.tistory.com/image/2674A84156C7E7FB266073" )
Book.create(title: "Introductioin to the Thermodynamics of Materials", writer: "David R Gaskell", publisher: "Taylor&Francis", published_at: "20081201", user_id: 1, picture: "https://images-na.ssl-images-amazon.com/images/I/41TmvLwafHL._SY344_BO1,204,203,200_.jpg" )
Book.create(title: "알고리즘 중심의 머신러닝 가이드", writer: "스티븐 마슬랜드", publisher: "제이펍", published_at: "20161228", user_id: 1, picture: "http://preview.yes24.com/PreviewResize.aspx?no=34723305&fn=ofa0e0tkma1sslvh01.jpg&size=535%7C700" )
Book.create(title: "필립 코틀러의 마켓 4.0", writer: "필립 코틀러", publisher: "길벗", published_at: "20170217", user_id: 1, picture: "http://image.yes24.com/momo/TopCate1069/MidCate003/106829951.jpg" )

# Book.create(title: "", writer: "", publisher: "", published_at: "", user_id: 1, picture: "" )


Post.create(book_id: "1", content: "안드로이드 7.0 누가버젼이 최신 버젼입니다.", user_id: "1", page: "1")
Post.create(book_id: "1", content: "인텐트는 무엇인가", user_id: "2", page: "1")
Reply.create(post_id: "1", content: "정말로 최신 버젼인가요?", user_id: "2")

Like.create(post_id: "1", user_id: "1")
Like.create(post_id: "1", user_id: "2")
Like.create(post_id: "2", user_id: "3")



puts("Seed Success!!")
