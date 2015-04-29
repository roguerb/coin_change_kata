class CoinChanger
  def change_for(amount)
    amount.zero? ? {} : { 1 => amount }
  end
end
