defmodule ElineuronTest do
  use ExUnit.Case

  test "should return a number" do
    assert Elineuron.neuron(:linear, [2, 3, 4, 5]) |> is_number
    assert Elineuron.neuron(:logistic, [2, 3, 4, 5]) |> is_number
    assert Elineuron.neuron(:hyperbolic, [2, 3, 4, 5]) |> is_number
  end

end
