# frozen_string_literal: true

RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:commentable) }
end
