require "test_helper"

feature "publishing a post" do
  scenario "author role cannot publish a post" do

    # post = Post.create(title: posts(:mj).title, content: posts(:mj).content)
    sign_in(:author)
    visit edit_post_path(posts(:cd).id)
    # the old way of doing it - finding first show link
    # first(:link, "Show Post").click

    page.text.wont_include 'Publish'

  end

  scenario "editor role can publish a post" do

    # post = Post.create(title: posts(:mj).title, content: posts(:mj).content)
    sign_in(:editor)
    visit edit_post_path(posts(:cd).id)
    # the old way of doing it - finding first show link
    # first(:link, "Show Post").click

    page.text.must_include 'Publish'

  end

end
