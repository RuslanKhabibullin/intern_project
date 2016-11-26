require "rails_helper"

feature "Comment destroy" do
  include_context "current user signed in"

  def create_comment
    fill_form(:comment, comment_attributes)
    click_button("Create Comment")
  end

  let(:article) { create(:article, author: current_user) }
  let(:comment_attributes) { attributes_for(:comment) }

  background { visit article_path(article) }

  scenario "Author delete own comment" do
    create_comment
    click_link("delete")

    expect(page).to have_content("successfully destroyed")
    expect(page).not_to have_content(comment_attributes[:text])
  end
end
