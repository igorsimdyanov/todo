RSpec.describe 'Пример' do
  context 'должен работать в случае' do
    it false do
      expect(false).to be_falsy
    end
    it true do
      expect(true).to be_truthy
    end
    xit 'отложен' do
    end
  end
end