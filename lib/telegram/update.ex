defmodule Telegram.Update do

  def extract_sender_date(%{"message" => %{"chat" => %{"id" => sender_id},
					  "date" => date}}) do
    {sender_id, date}
  end

  def extract_sender_date(update) do
    IO.inspect "WARNING :: unhandled update type>>"
    IO.inspect update
    {:unhandled_update_type}
  end
end
