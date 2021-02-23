# tem o s no final pois é um script

# todo teste usa o mesmo nome do modulo + Test

defmodule Api.NumbersTest do
  use ExUnit.Case

  alias Api.Numbers

  # descreve a funcao que vai ser testada

  # / o numero de argumentos
  describe "sum_from_file/1" do
    test "Quando o arquivo tem um nome, retorna a soma dos números no arquivo." do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "Quando o arquivo não tem um nome, retorna um erro." do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Invalid file"}}

      assert response == expected_response
    end
  end
end
