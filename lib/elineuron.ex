#!/usr/bin/env elixir
# Encoding: UTF-8
# ##########################################################
# elineuron.ex
# This is the most basic component of a neural network
# framework written in Elixir.
# Wesley Rodrigues da Silva <wesley.it at gmail.com>
# LICENCE CREATIVE COMMONS BY - 2014
# http://creativecommons.org/licenses/by/2.0/legalcode
# ##########################################################

defmodule Elineuron do

  @moduledoc """
  -- Neuron simulation

  This module should represent a neuron in a neural net.
  It gives 3 possibilities of activation functions:

  - hiperbolic (outputs between -1 and 1)
  - logistic (outputs between 0 and 1)
  - linear (0 or 1)
  """
  @doc "Main neuron function"
  def neuron(function, entries) do
    weights = Enum.map entries, fn(_) -> :random.uniform end
    blended =  Enum.zip entries, weights
    multipled = Enum.map blended, fn({weight, value}) -> value * weight end
    sum = Enum.sum multipled

    result = activation(function, sum)

    IO.puts """
        Type: #{function}
        Entries: #{inspect entries}
        Sum: #{inspect sum}
        Result: #{inspect result}
        """
    result
  end

  defp activation(function, x) when function == :hyperbolic do
    e = 2.71828182846 ## euler
    a = 1 ## function curve
    b = 1 ## limit + and -
    a * ((:math.pow(e, (b * x)) - :math.pow(e, (-b * x))) / (:math.pow(e, (b * x)) + :math.pow(e, (b * x))))
  end


  defp activation(funcao, x) when funcao == :logistic do
    e = 2.71828182846 ## euler
    a = 1 ## function curve
    1 / (1 + :math.pow(e, -a * x))
  end


  defp activation(function, x) when function == :linear do
    cond do
      x > 0 -> 1
      x < 0 -> 0
      true  -> 0
    end
  end

end
