# frozen_string_literal: true

RSpec.describe 'Вход в систему', driver: :selenium_chrome, js: true do
  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'commit'
  end

  context 'для администратора' do
    let(:user) { create :admin }

    it 'администрирования проходит успешно' do
      screenshot_and_save_page
      expect(page).to have_current_path admin_root_path, ignore_query: true
      expect(page).to have_content('пользователей')
    end
  end

  context 'для обычного пользователя' do
    let(:user) { create :user }

    it 'администрирования не проходит успешно' do
      expect(page).to have_no_current_path admin_root_path, ignore_query: true
      expect(page).not_to have_content('пользователей')
    end

    it 'проходит успешно' do
      visit admin_root_path
      expect(page).to have_current_path new_user_session_path, ignore_query: true
    end
  end
end
