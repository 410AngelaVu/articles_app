module ApplicationHelper

def user_author
if current_user.is_author?
	concat render partial: 'articles/show_art', locals: { f: f }
end

end
end