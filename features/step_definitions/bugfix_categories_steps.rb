Then /^the form fields should be blank$/ do
  # @category.name.should.be empty?
  # @category.keywords.should eq ''
  find_field('category_name').value.should be_blank
  find_field('category_permalink').value.should be_blank
  find_field('category_keywords').value.should be_blank
  find_field('category_description').value.should be_blank
end
