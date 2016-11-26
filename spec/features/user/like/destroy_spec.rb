require "rails_helper"

feature "Unlike" do
  include_context "current user signed in"

  let(:article) { create(:article, author: current_user) }

  before do
    visit article_path(article)
    click_link "like"
  end

  scenario "User unlike article" do
    click_link "unlike"
    expect(page).to have_content "Likes: 0"
  end
end
