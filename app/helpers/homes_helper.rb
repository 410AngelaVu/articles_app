module HomesHelper
  def home_author
    User.all.each do |f|
      concat render partial: 'homes/show_art', locals: { f: f } if f.is_author?
    end
  end
end
