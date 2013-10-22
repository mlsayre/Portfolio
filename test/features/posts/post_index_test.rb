require "test_helper"

feature "seeing posts in index" do

  scenario "editor should see all published and unpublished posts" do
    sign_in(:editor)

    # Given a previously created blog post
    visit posts_path
    # When I push the delete button
    #save_and_open_page

    # Then the post should be deleted
    page.must_have_content "Jerome Kersey"
    page.must_have_content "Terry Porter"

  end

  scenario "visitor should see only published posts" do

    visit posts_path

    page.wont_have_content "Jerome Kersey"
    page.must_have_content "Terry Porter"

  end
end
