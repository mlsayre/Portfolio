require "test_helper"

feature "I want to sign in to the site" do
  scenario "previously created user successfully signs in" do
    sign_in_user
    # save_and_open_page

    page.text.must_include "Signed in successfully"

  end
end
