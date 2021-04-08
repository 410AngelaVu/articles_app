module HomesHelper

def home_author
User.all.each do |f|
	if f.is_author?
		concat render partial: 'homes/show_art', locals: { f: f }
	end
end
end
end
