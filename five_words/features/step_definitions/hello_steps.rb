When (/^I go to the homepage$/) do
	visit root_path
end 

Then (/^I should see Hello Cucumber$/) do 
	expect(page).to have_content("Hello Cucumber")
end