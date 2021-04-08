module ApplicationHelper

def user_author
if current_user.is_author?
	concat render partial: 'articles/show_art', locals: { f: f }
end

end

def like_or_dislike_btn(article)
    like = Like.find_by(article: article, user: current_user)
    if like
      link_to('Dislike!', article_like_path(id: like.id, article_id: article.id), method: :delete)
    else
      link_to('Like!', article_likes_path(article_id: article.id), method: :post)
    end
  end

  def display_flash_messages
    
    unless flash[:notice].nil?
      concat content_tag(:p, notice,
                         class: 'alert alert-warning alert-dismissible fade show')
    end
  
  end
end