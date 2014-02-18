require 'errors'

module Poker
  class Card
    attr_accessor :face, :suit

    @@suits = [:clubs, :diamonds, :hearts, :spades]
    @@suit_symbols = 'cdhs'
    
    @@faces = [:ace, :deuce, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
    @@face_symbols = 'A23456789TJQK'

    def initialize(sym)
      #Validate input in the form of "Fs" where F is a capital face symbol and "s" is a lowercase suit symbol.
      raise Poker::InvalidCardError, "Unrecognized card format." if sym.length != 2
      face_sym = sym[0]
      suit_sym = sym[1]
      raise Poker::InvalidCardError, "Unrecognized face: #{face_sym}." if !@@face_symbols[face_sym]
      raise Poker::InvalidCardError, "Unrecognized suit: #{suit_sym}." if !@@suit_symbols[suit_sym]
      
      self.face = @@faces[@@face_symbols.index(face_sym)]
      self.suit = @@suits[@@suit_symbols.index(suit_sym)]
    end
    
    def to_s(format = :long)
      format == :long ? "#{self.face} of #{self.suit}" : "#{@@face_symbols[@@faces.index(self.face)]}#{@@suit_symbols[@@suits.index(self.suit)]}"
    end
    
  end
end