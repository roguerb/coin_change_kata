class CoinChanger
  USD = [100, 50, 25, 10, 5, 1]

  def initialize(denominations = USD)
    @denominations = denominations
  end

  def change_for(amount)
    remaining_amount = round_to_smallest_coin(amount)
    denominations.each_with_object(Hash.new(0)) do |denomination, result|
      result[denomination] = remaining_amount / denomination
      remaining_amount %= denomination
    end.delete_if { |_, value| value.zero? }
  end

  private

  def round_to_smallest_coin(amount)
    (amount.to_f / smallest_coin).round * smallest_coin
  end

  def smallest_coin
    denominations.last
  end

  attr_reader :denominations
end
