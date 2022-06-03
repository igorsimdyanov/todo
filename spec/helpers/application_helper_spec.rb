# frozen_string_literal: true

RSpec.describe ApplicationHelper, type: :helper do
  it :current_date do
    expect(helper.current_date).to eq Date.current.to_s
  end

  context :current_user_avatar do
    let(:user) { create(:user_with_avatar) }

    before { sign_in(user) }

    it 'возвращает true' do
      expect(helper.current_user_avatar).to include '<img class='
    end
  end

  context :current_user_avatar? do
    context 'когда пользователь не авторизован' do
      it 'возвращает false' do
        expect(helper).not_to be_current_user_avatar
      end
    end

    context 'когда пользователь авторизован и без аватарки' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      it 'возвращает false' do
        expect(helper).not_to be_current_user_avatar
      end
    end

    context 'когда пользователь авторизован и имеет аватарку' do
      let(:user) { create(:user_with_avatar) }

      before { sign_in(user) }

      it 'возвращает true' do
        expect(helper).to be_current_user_avatar
      end
    end
  end
end
