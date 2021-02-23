defmodule ApiWeb.WelcomeController do
  use ApiWeb, :controller

  # função recebe coon e os parametros
  # _params recebe mas ignora, tipo = null

  alias Api.Numbers

  # def index(conn, _params) do
  #   text(conn, "Welcome to the apiWeb")
  # end

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({ok, %{result: results}}, conn) do
    conn
    |> put_status(:ok)

    # IO.inspect tipo console.log no terminal
    # |> IO.inspect()
    |> json(%{message: "Welcome to Api. Here is your number #{results}"})
  end

  defp handle_response({ok, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
    #  pattern matching

    # example = %{value: x} = % {filename: "numbers", value 5}
    # pega o value do parametroend
end
