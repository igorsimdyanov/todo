require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { create(:item) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:event) }
end
