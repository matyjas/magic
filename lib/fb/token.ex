defmodule FB.Token do

  @fb_handshake_token Application.get_env(:magic, :fb, :token)[:handshake]

  def handshake, do: @fb_handshake_token
  
  def verify?(@fb_handshake_token, challenge) do
    {:match, challenge}
  end

  def verify?(_, _) do
    {:miss}
  end
end
