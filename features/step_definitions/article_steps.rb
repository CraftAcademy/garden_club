Given(/^"([^"]*)" has written the following articles:$/) do |name, table|
  table.hashes.each do |hash|
    set_user(name)
    title = hash[:title]
    body = hash[:body]
    FactoryGirl.create(:article, title: title, body: body, user: @user)
  end
end

Given(/^I am on the article page for article "([^"]*)"$/) do |title|
  visit article_path(Article.find_by(title: title))
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
