require "test_helper"

feature "updating a post" do
  scenario "author role can edit a post" do

    # post = Post.create(title: posts(:mj).title, content: posts(:mj).content)
    sign_in(:author)
    visit post_path(posts(:cd).id)
    # the old way of doing it - finding first show link
    # first(:link, "Show Post").click

    click_on "Edit"
    fill_in 'Title', with: posts(:cd).title
    fill_in 'Content', with: posts(:cd).content

    # When I submit the form
    click_on 'Update Post'

    # Then the post should be changed
    page.text.must_include posts(:cd).title
    page.text.must_include posts(:cd).content


    # And a success message
    page.text.must_include 'Post was successfully updated'

  end

    scenario "editor role can edit a post" do

    # post = Post.create(title: posts(:mj).title, content: posts(:mj).content)
    sign_in(:editor)
    visit post_path(posts(:cd).id)
    # the old way of doing it - finding first show link
    # first(:link, "Show Post").click
    click_on "Edit"
    fill_in 'Title', with: posts(:cd).title
    fill_in 'Content', with: posts(:cd).content

    # When I submit the form
    click_on 'Update Post'

    # Then the post should be changed
    page.text.must_include posts(:cd).title
    page.text.must_include posts(:cd).content


    # And a success message
    page.text.must_include 'Post was successfully updated'

  end

   scenario "visitor role cannot edit a post" do

    # post = Post.create(title: posts(:mj).title, content: posts(:mj).content)
    visit post_path(posts(:cd).id)

    # the old way of doing it - finding first show link
    # first(:link, "Show Post").click
    click_on "Edit"

    # sign in message
    page.text.must_include 'You need to sign in'

  end


end
