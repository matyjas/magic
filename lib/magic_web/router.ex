defmodule MagicWeb.Router do
  use MagicWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MagicWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", MagicWeb do
    pipe_through :api

    # Facebook Messenger
    get "/fb/v0", FBController, :subscribe
    post "/fb/v0", FBController, :messages

    # Telegram
    post "/telegram/v0", TelegramController, :updates
  end
end
