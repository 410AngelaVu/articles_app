module ArticlesHelper
  def articles_at(article)
    article.each do |x|
      concat render partial: 'articles/show_art', locals: { x: x }
    end
  end
end
