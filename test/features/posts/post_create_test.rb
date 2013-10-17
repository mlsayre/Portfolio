require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do

    #Given a completed post form
    sign_in_user
    visit new_post_path
    #save_and_open_page
    #click_on "Blog Posts"
    #click_on "New Post"
    #save_and_open_page
    fill_in 'Title', with: posts(:mj).title
    fill_in 'Content', with: posts(:mj).content

    # When I submit the form
    click_on 'Create Post'

    # Then I should see the new post
    page.text.must_include posts(:mj).title
    page.text.must_include posts(:mj).content


    # And a success message
    page.text.must_include 'Post was successfully created'
    assert page.has_css? "#author"
    page.text.must_include users(:one).email

  end
end
