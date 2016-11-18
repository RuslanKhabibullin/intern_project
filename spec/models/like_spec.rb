require 'rails_helper'

describe Like, type: :model do
  subject(:like) do
    user = create(:user)
    article = create(:article)
    attributes = { user: user, article: article }
    described_class.new(attributes)
  end

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:article) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:article_id) }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:article_id) }
end
