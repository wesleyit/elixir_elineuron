defmodule ElineuronTest do
  use ExUnit.Case

  test "The neuron can handle a hiperbolic function with 4 inputs" do
    assert is_number Elineuron.neuron(:hyperbolic, [2, 3, 4, 5])
  end


  test "The neuron can handle a logistic function with 4 inputs" do
    assert is_number Elineuron.neuron(:logistic, [2, 3, 4, 5])
  end


  test "The neuron can handle a linear function with 4 inputs" do
    assert is_number Elineuron.neuron(:linear, [2, 3, 4, 5])
  end

end
