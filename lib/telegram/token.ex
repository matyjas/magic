defmodule Telegram.Token do

  @telegram_token Application.get_env(:magic, :telegram, :token)[:telegram]
  
  def value, do: @telegram_token
  
end
