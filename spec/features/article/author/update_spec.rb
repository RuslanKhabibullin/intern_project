require "rails_helper"

feature "Update article" do
  include_context "current user signed in"

  let(:article) { create(:article, author: current_user) }

  background { visit edit_article_path(article) }

  scenario "Author update article with invalid data" do
    fill_form(:article, :edit, title: "")
    click_button("Update Article")

    expect(page).to have_content("problems")
  end

  scenario "Author update article with valid data" do
    fill_form(:article, :edit, title: "newTitle")
    click_button("Update Article")

    expect(page).to have_content("successfully updated")
    expect(page).to have_content("newTitle")
  end
end
