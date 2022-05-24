# frozen_string_literal: true

RSpec.describe Item, type: :model do
  subject { build(:item) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to belong_to(:event) }
end
