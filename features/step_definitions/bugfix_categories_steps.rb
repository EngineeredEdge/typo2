Then /^the form fields should be blank$/ do
  @category.name.should.be empty?
  @category.keywords.should eq ''
  find_field('permalinkgit').value.should eq ''
end
