require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    #Given a completed post form
    visit posts_path
    click_on "New Post"
    fill_in 'Title', with: posts(:mj).title
    fill_in 'Content', with: posts(:mj).content

    # When I submit the form
    click_on 'Create Post'

    # Then I should see the new post
    page.text.must_include posts(:mj).title
    page.text.must_include posts(:mj).content


    # And a success message
    page.text.must_include 'Post was successfully created'


  end
end
