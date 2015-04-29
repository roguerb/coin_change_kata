class CoinChanger
  DENOMINATIONS = [10, 5, 1]

  def change_for(amount)
    DENOMINATIONS.each_with_object(Hash.new(0)) do |denomination, result|
      result[denomination] = amount / denomination
      amount %= denomination
    end.delete_if { |_, value| value.zero? }
  end
end
