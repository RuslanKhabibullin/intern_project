require "rails_helper"

describe Likes::CreateLike do
  let(:current_user) { create(:user) }
  let(:article) { create(:article, author: current_user) }

  context "like article" do
    subject(:result) { described_class.call(current_user: current_user, article: article).like }

    it { expect(result.user).to be_eql current_user }
    it { expect(result.article).to be_eql article }
  end
end
