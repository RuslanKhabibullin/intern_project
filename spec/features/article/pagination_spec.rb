require "rails_helper"

feature "Article pagination" do
  include_context "current user signed in"

  it_behaves_like "a paginated resource" do
    let(:resource_creation) { 15.times { create(:article, author: current_user) } }
    let(:path) { articles_path }
  end
end
