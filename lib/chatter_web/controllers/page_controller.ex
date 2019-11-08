defmodule ChatterWeb.PageController do
  use ChatterWeb, :controller

  def chat(conn, _) do
    render conn, "index.html"
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
