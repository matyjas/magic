defmodule Dialog.ConvoTest do
  use MagicWeb.ConnCase, async: true

  alias Dialog.Convo

  describe "when a new conversation starts" do

    test "can receive messages" do
      {:ok, pid} = Convo.start_link []
    end
  end
end
