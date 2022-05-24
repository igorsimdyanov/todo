# frozen_string_literal: true

RSpec.describe Role, type: :model do
  subject { create(:role) }

  it { is_expected.to have_many(:users).dependent(:nullify) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:code) }
end
