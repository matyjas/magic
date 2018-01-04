defmodule FB.Gateway do

  @moduledoc """
  Sends things to Facebook Messenger endpoints
  """
  
  def send(recipient, message) do
    url = "https://graph.facebook.com/v2.6/me/messages?access_token=" <> FB.Token.page
    body = Poison.encode!(%{"recipient": %{"id": recipient},
                            "message": %{"text": message}})
    # sometimes the token goes bad, like when I changed my password, returned a 400
    HTTPotion.post url, [body: body, headers: ["Content-Type": "application/json"]]
  end
  
end
