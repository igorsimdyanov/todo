require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { create(:event) }

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:items).dependent(:destroy) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:commentators)
                      .through(:comments)
                      .source(:user) }
end
