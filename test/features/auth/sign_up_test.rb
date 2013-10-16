require "test_helper"

feature "I want to sign up for the site" do
  scenario "user successfully signs up" do
    visit new_user_registration_path
    fill_in "Email", with: "123@abc.com"
    fill_in "Password", with: "abcdefhi"
    fill_in "Password confirmation", with: "abcdefhi"
    click_on "Sign up"

    page.text.must_include "Welcome!"

  end
end
