require "test_helper"

feature "updating a post" do
  scenario "changes text as expected" do

    #Given a completed post form
    visit posts_path
    first(:link, "Show Post").click
    click_on "Edit"
    fill_in 'Title', with: 'blork'
    fill_in 'Content', with: 'dorkablorka boo'

    # When I submit the form
    click_on 'Update Post'

    # The I should see the new post
    page.text.must_include 'blork'
    page.text.must_include 'dorkablorka boo'


    # And a success message
    page.text.must_include 'Post was successfully updated'


  end
end
