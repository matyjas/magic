defmodule Telegram.Update do

  def extract_sender_date(%{"message" => %{"chat" => %{"id" => sender_id},
					  "date" => date}}) do
    {:ok, sender_id, date}
  end

  def extract_sender_date(update) do
    IO.inspect "WARNING :: unhandled update from messaging platform>>"
    IO.inspect update    	
    {:unhandled_update_type, update}
  end
end
