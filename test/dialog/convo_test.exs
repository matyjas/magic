defmodule Dialog.ConvoTest do
  use MagicWeb.ConnCase, async: true

  alias Dialog.Convo

  describe "when a conversation starts" do

    test "can receive utterances" do
      utterance = "/start"
      {:ok, pid} = Convo.start_link []
      Convo.add_utterance pid, utterance
      inspect Convo.get_utterances(pid)
      assert Convo.get_utterances(pid) == [utterance]
    end

    test "responds with onboarding" do

    end
  end
end
