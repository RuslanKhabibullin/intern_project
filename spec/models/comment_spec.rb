require 'rails_helper'

describe Comment, type: :model do
  subject(:comment) do
    attributes = attributes_for(:comment)
    attributes[:user] = create(:user)
    attributes[:article] = create(:article)
    described_class.new(attributes)
  end

  it { is_expected.to respond_to(:article_id) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:text) }
  it { is_expected.to validate_presence_of(:article_id) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:text) }

  it { is_expected.to be_valid }
end
