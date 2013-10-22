require "test_helper"

feature "deleting a post" do

  scenario "author role cannot delete other's posts" do
    sign_in(:author)

    # Given a previously created blog post
    visit posts_path
    # When I push the delete button
    #save_and_open_page

    # Then the post should be deleted
    page.wont_have_content "Destroy"

  end

  scenario "editor role can delete other's posts" do
    sign_in(:editor)

    # Given a previously created blog post
    visit posts_path
    # When I push the delete button
    save_and_open_page

    # Then the post should be deleted
    page.must_have_content "Destroy"

  end
end
