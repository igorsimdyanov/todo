require 'rails_helper'

RSpec.describe Role, type: :model do
  subject { create(:role) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:users) }
end
