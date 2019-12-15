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
end
