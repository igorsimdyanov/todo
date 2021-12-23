require 'ostruct'

RSpec.describe 'Объект' do
  context 'ключ-значение' do
    # before(:each) do
    #   @object = OpenStruct.new(key: 'ключ', value: 'значение')
    # end
    let(:object) { OpenStruct.new(key: 'ключ', value: 'значение') }

    it 'должен содержать корректный ключ' do
      expect(object.key).to eq 'ключ'
    end
  end
end
