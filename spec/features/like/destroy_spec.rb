require "rails_helper"

feature "Unlike" do
  include_context "current user signed in"

  let(:article) { create(:article, author: current_user) }

  before do
    visit article_path(article)
    click_button "Like"
  end

  scenario "User unlike article" do
    click_link "Unlike"
    expect(page).to have_content("Likes: 0")
    expect(page).to have_button("Like")
  end
end
