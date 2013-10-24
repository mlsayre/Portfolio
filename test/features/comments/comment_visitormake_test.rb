require "test_helper"

feature "making a comment" do
  scenario "visitor role can make a comment" do
    new_comment

    # And a success message
    page.text.must_include 'Comment is awaiting moderation.'

  end


end
