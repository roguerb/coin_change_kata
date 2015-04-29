class CoinChanger
  def change_for(amount)
    Hash.new(0).merge({ 5 => amount / 5, 1 => amount % 5 }).delete_if { |_, value| value.zero? }
  end
end
