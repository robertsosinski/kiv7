Given /^that they are on the list page$/ do
  visit '/en/lists'
  current_path.should eql lists_path(:locale => 'en')
end

When /^entering the task "([^"]*)"$/ do |task|
  find('#new-task').fill_in 'name', :with => task
  find('a.create').click
end

When /^marking the task "([^"]*)" as done$/ do |task|
  find('#tasks .task a.toggle').click
end

Then /^they should see (#{NUMBER}) tasks? done$/ do |number|
  wait
  all('#tasks .task .icon-star').size.should eql number
end

Then /^they should see (#{NUMBER}) tasks? open$/ do |number|
  wait
  all('#tasks .task .icon-star-empty').size.should eql number
end

Then /^they should see a blurb telling them they have (\d+) tasks left$/ do |number|
  page.should have_content "has #{number} tasks left"
end

