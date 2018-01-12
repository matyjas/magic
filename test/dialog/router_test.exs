defmodule Dialog.RouterTest do
  use MagicWeb.ConnCase, async: true

  alias Dialog.Router

  test "requests go into Router" do
    {:ok, pid} = Router.start_link []
    Router.route_request pid, "request from messaging client"
  end

end
