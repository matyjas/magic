defmodule FB.Event do

  def is_sender_message?(%{"message" => message}) do
    !is_message_echo?(message)
  end

  def is_sender_message?(_) do
    false
  end

  def is_message_echo?(%{"is_echo" => true}) do
    true
  end

  def is_message_echo?(_) do
    false
  end
end
