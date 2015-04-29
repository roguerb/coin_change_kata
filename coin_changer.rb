class CoinChanger
  USD = [100, 50, 25, 10, 5, 1]

  def initialize(denominations = USD)
    @denominations = denominations
  end

  def change_for(amount)
    denominations.each_with_object(Hash.new(0)) do |denomination, result|
      result[denomination] = amount / denomination
      amount %= denomination
    end.delete_if { |_, value| value.zero? }
  end

  private

  attr_reader :denominations
end
