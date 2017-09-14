defmodule MagicWeb.FBController do
  use MagicWeb, :controller

  alias FB.{EventBundle, Event, Token, Gateway}
  
  def messages(conn, params) do

    params
    |> EventBundle.split
    |> Enum.filter(&(Event.is_sender_message?(&1)))
    |> Enum.map(&(Event.extract_sender_timestamp(&1)))
    |> Enum.each(&(Gateway.send(elem(&1, 0), elem(&1, 1))))

    text conn, "ok"
  end
  
  def subscribe(conn, %{"hub.mode" => "subscribe",
			"hub.verify_token" => token,
		       "hub.challenge" => challenge}) do
    
    check(conn, Token.verify_handshake?(token, challenge))
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
