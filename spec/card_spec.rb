require 'rspec'
require 'card'
require 'meta'

describe Poker::Card do
  describe "Initialization" do
    it 'is created from a string' do
      card = Poker::Card.new('As')
      card.face.should eq :ace
      card.suit.should eq :spades
    end

    it 'has a human-readable name' do
      card = Poker::Card.new('Jd')
      card.to_s.should eq 'jack of diamonds'
    end

    it 'has a symbolic name' do
      'A23456789TJQK'.to_a.each do |f|
        'cdhs'.to_a.each do |s|
          card_sym = "#{f}#{s}"
          card = Poker::Card.new(card_sym)
          card.to_s(:short).should eq card_sym
        end
      end
    end
  end
  
  describe "Initialization errors" do
    it 'fails to create a card in an invalid format' do
      expect { card = Poker::Card.new('SPADES_ACE') }.to raise_error Poker::InvalidCardError, "Unrecognized card format."
    end
  
    it 'fails to create a card with an invalid face' do
      expect { card = Poker::Card.new('0s') }.to raise_error Poker::InvalidCardError, "Unrecognized face: 0."
    end

    it 'fails to create a card with an invalid suit' do
      expect { card = Poker::Card.new('Aw') }.to raise_error Poker::InvalidCardError, "Unrecognized suit: w."
    end
  end
  
end
