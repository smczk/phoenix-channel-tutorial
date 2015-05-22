defmodule PhoenixChannelTutorial.Router do
  use PhoenixChannelTutorial.Web, :router

  socket "/ws", PhoenixChannelTutorial do
    channel "rooms:*", RoomChannel
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixChannelTutorial do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixChannelTutorial do
  #   pipe_through :api
  # end
end
