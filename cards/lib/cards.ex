defmodule Cards do
  @moduledoc """
    Proporciona metodos para crear y manejar un maso de cartas
  """
  @doc """
  Retorna una lista que contiene strings con los valores y las pintas de las cartas
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven"]
    suits = ["Spades", " Hearts", "Clubs", " Diamons"]
    # no es la mejor forma
    # cards =
    #  for suit <- suits do
    #    for value <- values do
    #      "#{suit} of #{value}"
    #    end
    #  end
    # List.flatten(cards)
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Busca dentro del maso una carta
  el argumento card indica que carta se esta buscando

  ## Examples
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck,"Two of  Hearts")
        true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divide un maso y reparte una mano  el argumento hand_size
     indica el numero de cartas que se debe repartir

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not Exist"
    end
  end

  def create_hand(hand_size) do
    # mala practica
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
