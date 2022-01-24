require 'spec_helper'

RSpec.describe EventPolicy do
  subject { EventPolicy.new(user, event) }


  context 'для неавторизованного пользователя' do
    let(:event) { create(:event) }
    let(:user) { nil }

    it { is_expected.not_to permit(:index) }
    it { is_expected.not_to permit(:show) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:create) }
    it { is_expected.not_to permit(:edit) }
    it { is_expected.not_to permit(:update) }
    it { is_expected.not_to permit(:destroy) }
  end

  context 'для авторизованного пользователя' do
    let(:user) { create(:user) }
    let(:event) { create(:event, user: user) }

    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:edit) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:destroy) }
  end

  context 'для авторизованного администратора' do
    before(:all) { create(:role, code: :admin)}
    let(:user) { create(:user, role: build(:role, code: :admin)) }
    let(:event) { create(:event, user: user) }

    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:edit) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:destroy) }
  end
end
