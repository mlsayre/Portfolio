require "test_helper"

feature "approving a comment" do
  scenario "editor role can approve any comment" do
    new_comment
    sign_in(:editor)
    visit post_path(posts(:cd).id)
    #save_and_open_page

    # Then the post should be changed
    page.text.must_include 'Approve this comment'

  end
end
