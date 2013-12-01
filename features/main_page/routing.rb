When(/^I go to (.*)$/) do |url|
  visit path_to(url)
end