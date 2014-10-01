#!/usr/bin/env elixir
# Encoding: UTF-8
# ##########################################################
# elineuron.ex
# This is the most basic component of a neural network
# framework written in Elixir. (Comments and vars in pt_BR)
# Wesley Rodrigues da Silva <wesley.it at gmail.com>
# LICENCE CREATIVE COMMONS BY - 2014
# http://creativecommons.org/licenses/by/2.0/legalcode
# ##########################################################


defmodule Elineuron do

    def neuronio(funcao, entradas) do
        pesos = Enum.map entradas, fn(_) -> :random.uniform end
        valores = Enum.zip entradas, pesos
        soma = Enum.map valores, fn({valor, peso}) -> valor * peso end
        saida = ativacao(funcao, (Enum.sum soma))

        IO.puts """
        Tipo: #{funcao}
        Entradas: #{inspect entradas}
        Pesos: #{inspect pesos}
        Soma: #{inspect soma}
        Saida: #{inspect saida}
        """
        saida
    end


    def ativacao(funcao, x) when funcao == :hiperbolica do
        e = 2.71828182846 ## euler
        a = 1 ## curva da função
        b = 1 ## limite + e -
        a * ((:math.pow(e, (b * x)) - :math.pow(e, (-b * x))) / (:math.pow(e, (b * x)) + :math.pow(e, (b * x))))
    end


    def ativacao(funcao, x) when funcao == :logistica do
        e = 2.71828182846 ## euler
        a = 1 ## curva da função
        1 / (1 + :math.pow(e, -a * x))
    end


    def ativacao(funcao, x) when funcao == :linear do
        cond do
            x > 0 -> 1
            x < 0 -> 0
            true -> 0
        end
    end

end

Elineuron.neuronio(:linear, [2, 3, 4, 5])
Elineuron.neuronio(:logistica, [2, 3, 4, 5])
Elineuron.neuronio(:hiperbolica, [2, 3, 4, 5])

