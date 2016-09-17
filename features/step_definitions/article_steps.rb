Given(/^"([^"]*)" has written the following articles:$/) do |name, table|
  table.hashes.each do |hash|
    set_user(name)
    title = hash[:title]
    body = hash[:body]
    tags = hash[:tags]
    FactoryGirl.create(:article, title: title, body: body, tag_list: tags, user: @user)
  end
end

Given(/^I am on the article page for article "([^"]*)"$/) do |title|
  article = Article.find_by(title: title)
  visit article_path(article)
  expect(current_path).to eq article_path(article)
end

Given(/^I am on the "([^"]*)" for "([^"]*)"$/) do |page, user|
  visit user_articles_path(@user)
end

Given(/^I visit someones compose page$/) do
  @user = FactoryGirl.create(:user)
  visit new_user_article_path(@user)
end

def set_user(name)
  @user = User.find_by(name: name)
end
