When /^I go to the home page$/ do
  visit "/"
end

Then /^I should be on the home page$/ do
  current_path.should == (@current_user ? problems_path : root_path)
end

Then /^I should see an? (success|error) message$/ do |type|
  element_css = type == "success" ? "div#notice" : "div#alert, div#error"
  wait_until { page.find('div#flash') }
  within "div#flash" do
    page.all(element_css).count.should >= 1
  end
end

Then /^I should see some error messages$/ do
  page.all("div#error_explanation").count.should == 1
end
