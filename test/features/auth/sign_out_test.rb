require "test_helper"

feature "I want to sign out of the site" do
  scenario "user successfully signs out" do
    visit new_user_registration_path
    fill_in "Email", with: "123@abc.com"
    fill_in "Password", with: "abcdefhi"
    fill_in "Password confirmation", with: "abcdefhi"
    click_on "Sign up"
    # save_and_open_page

    click_on "Sign Out"

    page.text.must_include "successfully signed out"

  end
end
