defmodule Dialog.RouterTest do
  use MagicWeb.ConnCase, async: true

  alias Dialog.Router

  @sample_req_id 228303213
  @sample_req {:req, %{"message" =>
			%{"chat" =>
			   %{"first_name" => "Maciej",
			     "id" => @sample_req_id,
			     "type" => "private", "username" => "Matyjas"},
			  "date" => 1515999126,
			  "from" => %{"first_name" => "Maciej",
				      "id" => @sample_req_id,
				      "is_bot" => false, "language_code" => "en-US", "username" => "Matyjas"}, "message_id" => 121, "text" => "hi"}, "update_id" => 158840602}}
  
  test "requests go into Router" do
    {:ok, pid} = Router.start_link []
    Router.route_request pid, "request from messaging client"
  end

  test "empty router & new message" do
    state = %Router{message: Telegram.Update, lookup: %{}}
    {:noreply, new_state} = Router.handle_cast(@sample_req, state)
    assert Map.has_key?(new_state.lookup, @sample_req_id)
  end
end
