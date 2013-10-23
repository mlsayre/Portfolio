require "test_helper"

feature "approving a comment" do
  scenario "editor role can approve any comment" do
    # random visitor makes an idiotic comment
    new_comment
    sign_in(:editor)
    #save_and_open_page

    # Then the post should be changed
    page.text.must_include 'Approve this comment'

    # TODO: Author can approve anyone's comment on their own post

  end
end
