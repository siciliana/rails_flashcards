class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
    @round = Round.create(deck_id: @deck.id)
    @card_number = 1
    @card = @deck.cards.find(@card_number)



   
    @card_number = (params[:card_id]).to_i
    @current_card = Card.find(@card_number)
    @deck_length = @deck.cards.length
    @correct_guess_count = @round.correct_guess_count

    while @card_number < @deck_length
      if @card_number > 1
      @previous_card = Card.find(@card_number - 1)
    end

    @user_answer = params[:user_answer] 

    if @user_answer == @current_card.answer
      @correctness = true
      @correct_guess_count += 1
      Round.update(@round.id, correct_guess_count: @correct_guess_count)
      @guess = Guess.create(
        answer_input: @user_answer, 
        card_id: @card_number, 
        round_id: @round.id, 
        correctness: @correctness
      )
      @card_number += 1
      @card = Card.find(@card_number)

    else
      @correct_guess_count += 1
      Round.update(@round.id, correct_guess_count: @correct_guess_count)

      @guess = Guess.create(
      answer_input: @user_answer, 
      card_id: @card_number, 
      round_id: @round.id, 
      )
      @card_number += 1
      @card = Card.find(@card_number)

      
    end
  end
  end



end
