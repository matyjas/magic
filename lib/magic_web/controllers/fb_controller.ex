defmodule MagicWeb.FBController do
  use MagicWeb, :controller

  import FB.Token
  
  def challenge(conn, params) do
    text conn, "default"
  end

end
