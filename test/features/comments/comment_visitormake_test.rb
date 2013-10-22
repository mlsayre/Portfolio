require "test_helper"

feature "making a comment" do
  scenario "visitor role can make a comment" do

    #
    new_comment
    #visit post_path(posts(:cd).id)
    save_and_open_page

    # Then the comment should be visible
    page.text.must_include "Jerky Jerkface"
    page.text.must_include "I hate you"

    # And a success message
    page.text.must_include 'Comment was successfully created'

  end


end
