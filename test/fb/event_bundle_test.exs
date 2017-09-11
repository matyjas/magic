defmodule FB.EventBundleTest do
  use MagicWeb.ConnCase, async: true

  alias FB.{EventBundle}

  test "empty message begets empty list" do
    entries = EventBundle.split %{}
    assert is_list entries
  end

  test "sample update has one event" do
    entry =   %{"id" => "116090092394138",
			     "messaging" =>
			       [%{"message" =>
				   %{"mid" => "mid.$cAABplXIuOB9ko-ghElecqLcyxWy_",
				     "nlp" => %{"entities" => %{}}, "seq" => 7850,
				     "text" => "what is the future?"},
				  "recipient" => %{"id" => "116090092394138"},
				  "sender" => %{"id" => "1646924535352518"},
				  "timestamp" => 1505161828626}],
		    "time" => 1505161829395}
    sample = %{"entry" => [entry],
	       "object" => "page"}
    entries = EventBundle.split(sample)
    assert 1 == length entries
    assert entry == hd entries
  end

end
