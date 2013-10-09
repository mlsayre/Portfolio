require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    #Given a completed post form
    visit posts_path
    click_on "New Post"
    fill_in 'Title', with: 'I love kitties'
    fill_in 'Content', with: 'They have tails and whiskers'

    # When I submit the form
    click_on 'Create Post'

    # The I should see the new post
    page.text.must_include 'I love kitties'
    page.text.must_include 'tails and whiskers'


    # And a success message
    page.text.must_include 'Post was successfully created'


  end
end
