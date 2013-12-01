# encoding: UTF-8
Then(/^I see all sections$/) do
  page.should have_content('Статьи')
  page.should have_content('События')
  page.should have_content('Места')
  page.should have_content('Проекты')
end

And(/^I see weather block$/) do
  page.should have_css("#weather")
  within("#weather") do
    page.should have_content('C °')
  end
end