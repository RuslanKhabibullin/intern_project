require "rails_helper"

feature "Unlike" do
  include_context "current user signed in"

  def click_heart_link
    within ".article-likes" do
      find("a").click
    end
  end

  let(:article) { create(:article, author: current_user) }

  before do
    visit article_path(article)
    click_heart_link
  end

  scenario "User unlike article" do
    click_heart_link
    expect(page).to have_content "Likes: 0"
  end
end
