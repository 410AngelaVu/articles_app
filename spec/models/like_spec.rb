require 'rails_helper'

RSpec.describe Like, type: :model do
	  current_user = User.first_or_create!(email: 'deja@example.com', name: 'deja', password: 'password',
                                       password_confirmation: 'password')
	  like = Like.create(article_id: 1, user_id: 1)
	  article = Article.create(title:'lala', body:'lala')

 it "is invalid without a user" do
  current_user.name = nil
  expect(like).to_not be_valid
end

it "is invalid without a article" do
  article.title = nil
  expect(like).to_not be_valid
end

end
