defmodule Telegram.Update do

  def extract_sender_date(%{"message" => %{"chat" => %{"id" => sender_id},
					  "date" => date}}) do
    {sender_id, date}
  end

  def extract_sender_date(update) do
    {:unhandled_update_type, update}
  end
end
