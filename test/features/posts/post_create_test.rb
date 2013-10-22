require "test_helper"

feature "creating a post" do
  scenario "author role user can create a post" do

    #Given a completed post form
    sign_in(:author)
    # save_and_open_page
    visit new_post_path
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
    page.text.must_include users(:author).email

  end

    scenario "editor role user can create a post" do

    #Given a completed post form
    sign_in(:editor)
    # save_and_open_page
    visit new_post_path
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
    page.text.must_include users(:editor).email

  end
end
