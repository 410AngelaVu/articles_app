module UsersHelper
  def user_article(user)
    user.articles.each do |f|
      concat render partial: 'users/show_art', locals: { f: f }
    end
  end

  def current_author(article)
    concat render partial: 'users/aut_art', locals: { f: f } if current_user.articles.include?(article)
  end

  def user_like(user)
    user.likes.each do |f|
      concat(link_to(f.article.title, f.article, class:'nav-link'))
    end
  end
end
