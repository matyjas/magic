defmodule MagicWeb.FBController do
  use MagicWeb, :controller
  
  def subscribe(conn, %{"hub.mode" => "subscribe",
			"hub.verify_token" => token,
		       "hub.challenge" => challenge}) do
    
    check(conn, FB.Token.verify?("subscribe", token, challenge))
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
    text(conn, challenge)
  end

end
