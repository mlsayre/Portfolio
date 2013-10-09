require "test_helper"

feature "WelcomeText" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Matt Sayre"
    page.wont_have_content "Sucks as a programmer!"
  end
end
