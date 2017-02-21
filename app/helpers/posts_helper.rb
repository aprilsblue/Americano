module PostsHelper
  def render_with_hashtags(body, book_id)
    body.gsub(/#[a-zA-Z0-9가-힣]+/){|word| link_to word, "/hashtag/#{word.delete('#')}?book_id=#{book_id}"}.html_safe
  end
end
