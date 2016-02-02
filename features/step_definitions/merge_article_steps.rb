Given /^the following articles exist$/ do |table|
  # table is a Cucumber::Ast::Table
  Article.create table.hashes
end

Given /^the following users exist$/ do |table|
  User.create table.hashes
  # table.hashes.each do |user|
  #   User.create(user)
  # end
end

Given /^the following comments exist for an article with a title of "(.*?)"$/ do |title, table|
  # table is a Cucumber::Ast::Table
  article = Article.find_by_title(title)
  table.hashes.map do |comment|
    Comment.create(
      :article_id => article[:id],
      :author => comment[:author],
      :email => comment[:email],
      :body => comment[:body]
      )
    end
end

Then /^the article$/ do
  pending # express the regexp above with the code you wish you had
end


Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
    Article.find_by_title(title).body.should eq body
end