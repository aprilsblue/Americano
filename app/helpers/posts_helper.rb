module PostsHelper
  def render_with_hashtags(body)
    body.gsub(/#\w+/){|word| link_to word, "/posts/hashtag/#{word.delete('#')}"}.html_save
  end
end
