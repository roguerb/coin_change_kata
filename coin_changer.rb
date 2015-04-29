class CoinChanger
  def change_for(amount)
    { 5 => amount / 5, 1 => amount % 5 }.delete_if { |_, value| value.zero? }
  end
end
