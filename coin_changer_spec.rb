require 'rspec'
require_relative 'coin_changer'

RSpec.describe CoinChanger do
  subject(:coin_changer) { CoinChanger.new }

  describe 'acceptance' do
    it 'returns a combination of coins' do
      pending 'Not ready to pass acceptance test yet'
      change = coin_changer.change_for(394)
      coins = {
        100 => 3,
        50 => 1,
        25 => 1,
        10 => 1,
        5 => 1,
        1 => 4
      }
      expect(change).to eq coins
    end
  end

  describe 'unit specs' do
    it 'returns no coins for $0.00' do
      change = coin_changer.change_for(0)
      expect(change).to eq({})
    end
  end
end
