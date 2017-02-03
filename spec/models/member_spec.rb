require_relative '../spec_helper'

describe Member do
  describe '#valid?' do
    it 'user_name が必須' do
      expect(Member.new.valid?).to be false
    end
  end
end