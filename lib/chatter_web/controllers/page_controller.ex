defmodule ChatterWeb.PageController do
  use ChatterWeb, :controller

  def chatone(conn, _) do
    render conn, "chatroomone.html"
  end

  def chattwo(conn, _) do
    render conn, "chatroomtwo.html"
  end

  def index(conn, _) do
    render conn, "homepage.html"
  end

  def contact(conn, _) do
    render conn, "contact.html"
  end

  def about(conn, _) do
    render conn, "about.html"
  end

end
