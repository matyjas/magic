defmodule Dialog.ConvoTest do
  use MagicWeb.ConnCase, async: true

  alias Dialog.Convo

  describe "when a conversation starts" do

    test "can receive utterances" do
      utterance = "/start"
      {:ok, pid} = Convo.start_link []
      Convo.add_utterance pid, utterance
      assert Convo.get_utterances(pid) == [utterance]
    end
  end
end
