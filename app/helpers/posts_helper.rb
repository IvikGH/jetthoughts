module PostsHelper

  def textilize(text)
    RedCloth.new(text).to_html
  end
end
