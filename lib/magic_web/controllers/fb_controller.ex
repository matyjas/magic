defmodule MagicWeb.FBController do
  use MagicWeb, :controller

  alias FB.{EventBundle, Token}
  
  def messages(conn, params) do

    params
    |> EventBundle.split
    |> IO.inspect

    text conn, "thanks"
  end
  
  def subscribe(conn, %{"hub.mode" => "subscribe",
			"hub.verify_token" => token,
		       "hub.challenge" => challenge}) do
    
    check(conn, Token.verify?(token, challenge))
  end

  def subscribe(conn, _params) do
    conn
    |> put_status(400)
    |> text("something aint right, its the strobe light")
  end
  
  defp check(conn, {:miss}) do
    conn
    |> put_status(403)
    |> text("check your tokens")
  end

  defp check(conn, {:match, challenge}) do
    text conn, challenge
  end

end
