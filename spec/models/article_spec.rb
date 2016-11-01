require 'rails_helper'

describe Article, type: :model do
  subject(:article) do
    attributes = attributes_for(:article).merge(author: author)
    described_class.new(attributes)
  end

  let(:author) { create(:user) }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:author) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:author_id) }
  it { is_expected.to validate_length_of(:title).is_at_least(2) }
  it { is_expected.to validate_length_of(:title).is_at_most(150) }

  it { is_expected.to be_valid }

  context 'when same article already exists' do
    before do
      article_dup = article.dup
      article_dup.save!
    end

    it { is_expected.not_to be_valid }
  end
end