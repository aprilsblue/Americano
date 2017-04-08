User.create(email: "admin@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user1@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user2@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user3@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user4@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user5@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user6@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user7@test.com", password: "123412", password_confirmation: "123412")
User.create(email: "user8@test.com", password: "123412", password_confirmation: "123412")

Book.create!([
  {title: "Do It! 안드로이드 앱 프로그래밍", writer: "정재곤", publisher: "이지스퍼블리싱", published_at: "2017-02-22 00:00:00", picture: "http://misc.ridibooks.com/cover/754018350/xxlarge", edition: nil, user_id: 1},
  {title: "퍼펙트 루비 온 레일즈", writer: "야마다 요시히로", publisher: "제이펍", published_at: "2015-12-30 00:00:00", picture: "http://cfile29.uf.tistory.com/image/2674A84156C7E7FB266073", edition: nil, user_id: 1},
  {title: "Introductioin to the Thermodynamics of Materials", writer: "David R Gaskell", publisher: "Taylor&Francis", published_at: "2008-12-01 00:00:00", picture: "https://images-na.ssl-images-amazon.com/images/I/41TmvLwafHL._SY344_BO1,204,203,200_.jpg", edition: nil, user_id: 1},
  {title: "알고리즘 중심의 머신러닝 가이드", writer: "스티븐 마슬랜드", publisher: "제이펍", published_at: "2016-12-28 00:00:00", picture: "http://preview.yes24.com/PreviewResize.aspx?no=34723305&fn=ofa0e0tkma1sslvh01.jpg&size=535%7C700", edition: nil, user_id: 1},
  {title: "필립 코틀러의 마켓 4.0", writer: "필립 코틀러", publisher: "길벗", published_at: "2017-02-17 00:00:00", picture: "http://image.yes24.com/momo/TopCate1069/MidCate003/106829951.jpg", edition: nil, user_id: 1},
  {title: "King", writer: "John berger", publisher: "열화당", published_at: "2014-06-20 00:00:00", picture: "http://image.kyobobook.co.kr/images/book/xlarge/654/x9788930104654.jpg", edition: nil, user_id: 4},
  {title: "Discrete mathematics and its application", writer: "Kenneth H Rosen", publisher: "McGraw-Hill Higher Education", published_at: "2012-09-01 00:00:00", picture: "https://images-na.ssl-images-amazon.com/images/I/51faFhHDjPL._SX399_BO1,204,203,200_.jpg", edition: nil, user_id: 5}
])
Post.create!([
  {content: "인텐트는 무엇인가", page: 1, user_id: 2, book_id: 1},
  {content: "<p><strong>디자인 탭에서 한글이 표시되지 않을때 for mac&nbsp;</strong></p>\r\n\r\n<p>mac os Elcapitan, Android 2.2.3</p>\r\n\r\n<p>최상위 경로에서, (~가 보일때) 터미널에 다음과 같이 작성한다. <span style=\"color:#ffffff\"><span style=\"background-color:#e74c3c\">(이때 Users/Applications가 아님을 주의한다.)</span></span></p>\r\n\r\n<pre>\r\n<code class=\"language-bash\">cd /Applications/Android Studio.app/Contents/plugins/android/lib/layoutlib/data/fonts\r\n</code></pre>\r\n\r\n<p>&nbsp;이 경로에서 fonts.xml을 열어서 lang=&quot;ko&quot;부분의 폰트를 NanumGothic.ttf로 바꿔준다.</p>\r\n\r\n<p>(위 경로에서 ls를 누르면 나눔고딕이 기본적으로 설치되어있는것을 확인 할 수 있다.)</p>\r\n\r\n<p>&nbsp;</p>\r\n", page: 55, user_id: 5, book_id: 1},
  {content: "<p><strong>Intent? 인텐트?</strong></p>\r\n\r\n<p>버튼 함수를&nbsp;만들 때 Intent를 정의하게 된다. 여기서 Intent는 저자에 의하면 안드로이드 플랫폼에게 전달할 무엇이다. 플랫폼상 다른 애플리케이션이나 다른 액티비티를&nbsp;이용할고자 할 때(전화걸기, 웹브라우져 등등)사용한다. Intent에 실어서 보내면 알아서 플랫폼이 애플리케이션 구성 요소간에 데이터를 전달, 실행해준다.</p>\r\n\r\n<p>Intent myIntent = new Intent(사용할 함수 또는 기능, 실어줄 것)</p>\r\n\r\n<p>Example</p>\r\n\r\n<pre>\r\n<code class=\"language-java\">// 전화걸기\r\nIntent myIntent = new Intent(Intent.ACTION_VIEW, Uri_parse(\"tel:010-0000-0000\"));\r\n\r\n// 다른 액티비티 켜기\r\nIntent intent = new Intent(getApplicationContext(), NewActivity.class);</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n", page: 66, user_id: 5, book_id: 1},
  {content: "<p>Put your title here</p>\r\n\r\n<p>Content</p>\r\n", page: 55, user_id: 1, book_id: 1},
  {content: "<p><strong><span style=\"font-size:1rem\">Proposition</span>에 대해서</strong></p>\r\n\r\n<p>참 거짓을 구별할 수 있는 명제를 뜻한다. 명제를 한 기호로 나타낸 것을 proposition variables(statement variables)이라 한다.</p>\r\n\r\n<p>&not;p 는 &nbsp;p의 부정형이다. 부정형의 기호로 &#39;&not;&#39; 를 사용하며&nbsp; negation operatior라 한다. (~p와 같은듯)</p>\r\n", page: 2, user_id: 5, book_id: 7},
  {content: "<p><strong>Connectives</strong></p>\r\n\r\n<p>Conjunction: and 개념, 둘다 참일 때 만 참. &nbsp; p ^ q&nbsp;</p>\r\n\r\n<p>Disjunction: or 개념. 하나라도 참일 때 참이다. p v q</p>\r\n\r\n<p>&nbsp;* or는&nbsp;inclusive, exclusive로 두개로 나뉜다. 여기서 disjunction이 inclusive or의 의미를 가지고 있다. exclusive or는 xor이라고 하여 두 명제 &nbsp;가 서로 다를 때만 참이다.</p>\r\n", page: 4, user_id: 5, book_id: 7},
  {content: "<p><strong>Conditional Statement</strong></p>\r\n\r\n<p>대부분의 영어표현은 수긍이 갈 수 있지만, <span style=\"background-color:#2ecc71\">&nbsp;p only if q&nbsp;</span> 표현의 경우&nbsp;주의해야한다. 이 표현은 if p, q 와 같은 표현이다.</p>\r\n\r\n<p>p -&gt; q 가 참이기 위해서는 둘다 참이거나, p가 거짓이어야 한다.</p>\r\n", page: 6, user_id: 5, book_id: 7},
  {content: "<p><strong>Convers, Contrapositive, and Inverse</strong></p>\r\n\r\n<p>p&nbsp;&rarr; q</p>\r\n\r\n<p>Convers = 역, q&nbsp;&rarr; p</p>\r\n\r\n<p>Contrapisitive = 대우,&nbsp;&not; q v &rarr;&nbsp;&not; q</p>\r\n\r\n<p>Inverse = 이,&nbsp;&not; q &rarr; &not; q</p>\r\n", page: 8, user_id: 5, book_id: 7},
  {content: "<p><strong>Biconditional Statement</strong></p>\r\n\r\n<p>p &lt;-&gt;&nbsp;q</p>\r\n\r\n<p>p if and only if q인 경우로 서로 필요충분조건일 때를 뜻함. ( p iff q )</p>\r\n", page: 9, user_id: 5, book_id: 7},
  {content: "<p><strong>&nbsp;API문서 읽기 for mac</strong></p>\r\n\r\n<p>클래스명을 블록으로 씌운 뒤, 윈도우는 Ctrl + q지만 맥에서 같은 명령어를 치면 창을 끄게 된다.</p>\r\n\r\n<p>mac에서는 F1 또는 fn + F1을 누르면 API문서를 확인 할 수 있다.</p>\r\n", page: 141, user_id: 5, book_id: 1},
  {content: "<p><strong>제약조건 레이아웃 만들기</strong></p>\r\n\r\n<p>책에서는 default가 제약조건 레이아웃이라고 하지만, 이상하게도 맥에서는 linear layout이다.</p>\r\n\r\n<p>activity_main.xml을 열고, Pallet 아래에 있는 Component tree에서 layout을 눌러 오른쪽 키를 누른 뒤 Covert LinearLayout to ConstaraintLayout을 클릭한다.</p>\r\n\r\n<p>하고나면 &nbsp;Sync를 눌러 build를 다시해주는데 여기서 에러가 발생하면 에러메시지를 읽고 추가적인 모듈을 설치하면 된다.&nbsp;</p>\r\n", page: 158, user_id: 5, book_id: 1}
])
Reply.create!([
  {content: "정말로 최신 버젼인가요?", post_id: 1, user_id: 2}
])
puts("Seed Success!!")
