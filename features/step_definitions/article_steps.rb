Given(/^"([^"]*)" has written the following articles:$/) do |name, table|
  table.hashes.each do |hash|
    user = User.find_by(name: name)
    title = hash[:title]
    body = hash[:body]
    FactoryGirl.create(:article, title: title, body: body, user: user)
  end
end

Given(/^I am on the article page for article "([^"]*)"$/) do |title|
  visit article_path(Article.find_by(title: title))
end
