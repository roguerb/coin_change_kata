require 'rspec'
require_relative 'coin_changer'

RSpec.describe CoinChanger do
  describe 'acceptance' do
    it 'returns a combination of coins' do
      pending 'Not ready to pass acceptance test yet'
      coin_changer = CoinChanger.new
      amount = 394
      change = coin_changer.change_for(amount)
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
end
