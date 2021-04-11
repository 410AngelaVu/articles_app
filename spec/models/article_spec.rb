require 'rails_helper'

RSpec.describe Article, type: :model do
  current_user = User.first_or_create!(email: 'deja@example.com', name: 'deja', password: 'password',
                                       password_confirmation: 'password')

  it 'has a title' do
    article = Article.new(
      title: '',
      body: 'A valid body',
      author: current_user
    )
    expect(article).to_not be_valid
    article.title = 'A valid title'
    expect(article).to be_valid
  end

  it 'has a body' do
    article = Article.new(
      title: 'A valid title',
      body: '',
      author: current_user
    )
    expect(article).to_not be_valid
    article.body = 'A valid body'
    expect(article).to be_valid
  end

  it 'has a title at least 2 chars long' do
    article = Article.new(
      title: '',
      body: 'A valid body',
      author: current_user
    )
    expect(article).to_not be_valid
    article.title = 'ab'
    expect(article).to be_valid
  end

  it 'has a body between 2 and 5000 chars long' do
    article = Article.new(
      title: 'A valid title',
      body: '',
      author: current_user
    )
    expect(article).to_not be_valid
    article.body = 'ab'
    expect(article).to be_valid
  end
end
