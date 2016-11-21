require "rails_helper"

feature "Update article by another user" do
  include_context "current user signed in"

  let(:article) { create(:article, author: create(:user)) }

  background { visit edit_article_path(article) }

  scenario "Another user update article" do
    expect(page).not_to have_content("Update article")
  end
end
