defmodule FB.Token do

  @moduledoc """
  Entity for working with tokens to send & receive messages from Facebook
  """
  
  @fb_handshake_token Application.get_env(:magic, :fb, :token)[:handshake]
  @fb_page_token Application.get_env(:magic, :fb, :token)[:page]
  
  def handshake, do: @fb_handshake_token

  def page, do: @fb_page_token
  
  def verify_handshake?(@fb_handshake_token, challenge) do
    {:match, challenge}
  end

  def verify_handshake?(_, _) do
    {:miss}
  end
end
