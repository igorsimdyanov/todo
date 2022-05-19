require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { build(:event) }

  context 'в невалидном состоянии' do
    let(:event) { build(:event_wrong) }
    
    it 'когда пустое название' do
      expect(event).not_to be_valid
      error_message = 'Name обязательно для заполнения'
      expect(event.errors.full_messages).to include error_message
    end

    it 'когда отсутствует владелец' do
      expect(event).not_to be_valid
      error_message = 'User не может отсутствовать'
      expect(event.errors.full_messages).to include error_message
    end
  end

  context 'в валидном состоянии' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to belong_to(:user).counter_cache(true) }
    it { is_expected.to have_many(:items).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:nullify) }
    it { is_expected.to have_many(:commentators).through(:comments).source(:user) }

    # it 'удовлетворяет валидациям' do
    #   expect(event).to be_valid
    # end

    # context 'belongs_to связь' do
    #   it 'успешно работает' do
    #     expect(event).to respond_to(:user)
    #     expect(event.user).to be_instance_of(User)
    #   end

    #   it 'успешно увеличивает счетчик в таблице events' do
    #     expect {
    #       user.events.create(FactoryBot.attributes_for(:event))
    #     }.to change { user.events_count }.by(1)
    #   end
    # end
  end
end
