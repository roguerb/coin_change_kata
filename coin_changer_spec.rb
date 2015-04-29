require 'rspec'
require_relative 'coin_changer'

RSpec.describe CoinChanger do
  subject(:coin_changer) { CoinChanger.new(denominations) }
  let(:denominations) { CoinChanger::USD }

  describe 'acceptance' do
    context 'with American coins' do
      it 'returns a combination of coins' do
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

    context 'with European coins' do
      let(:denominations) { [200, 100, 50, 20, 10, 5, 1] }

      it 'works with European coins' do
        change = coin_changer.change_for(399)
        coins = {
          200 => 1,
          100 => 1,
          50 => 1,
          20 => 2,
          5 => 1,
          1 => 4
        }
        expect(change).to eq coins
      end
    end

    context 'with Canadian coins' do
      let(:denominations) { [200, 100, 50, 25, 10, 5] }

      it 'works with Canadian coins' do
        change = coin_changer.change_for(398)
        coins = { 200 => 2 }
        expect(change).to eq coins
      end
    end
  end

  describe 'unit specs' do
    [
      # amount  change
      [ 0,      {}                   ],
      [ 1,      {   1 => 1 }         ],
      [ 2,      {   1 => 2 }         ],
      [ 5,      {   5 => 1 }         ],
      [ 8,      {   5 => 1, 1 => 3 } ],
      [ 10,     {  10 => 1 }         ],
      [ 25,     {  25 => 1 }         ],
      [ 50,     {  50 => 1 }         ],
      [ 100,    { 100 => 1 }         ]
    ].each do |amount, expected|
      it "returns coins for #{amount} cents" do
        change = coin_changer.change_for(amount)
        expect(change).to eq expected
      end
    end

    it 'returns 0 coins for unused denominations' do
      change = coin_changer.change_for(0)
      any_denomination = 1
      expect(change[any_denomination]).to eq 0
    end
  end

  describe 'rounding' do
    let(:denominations) { [10, 5] }

    it 'rounds down to smallest denomination' do
      change = coin_changer.change_for(2)
      expect(change).to eq({})
    end

    it 'rounds up to smallest denomination' do
      change = coin_changer.change_for(3)
      expect(change).to eq(5 => 1)
    end
  end
end
