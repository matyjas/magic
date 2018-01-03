defmodule Telegram.Token do

  @moduledoc """
  Encapsulates token for auth with Telegram, pulled from environment var
  """
  
  @telegram_token Application.get_env(:magic, :telegram, :token)[:telegram]
  
  def value, do: @telegram_token
  
end
