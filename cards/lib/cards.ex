defmodule Cards do
  def create_deck do
    values = ["ace", "Two", "Three", "Four", "Five", "Six", "Seven"]
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

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

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
