class CardsController < ApplicationController
  
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:deck_id])
    @round = Round.create(deck_id: @deck.id)
    @card_number = (params[:id]).to_i
    @current_card = Card.find(@card_number)

    @deck_length = @deck.cards.length
    @correct_guess_count = @round.correct_guess_count
  end 

  def update

    @deck = Deck.find(params[:deck_id])
    @round = Round.create(deck_id: @deck.id)
    @card_number = (params[:id]).to_i
    @current_card = Card.find(@card_number)

    @deck_length = @deck.cards.length
    @correct_guess_count = @round.correct_guess_count


    @user_answer = params[:answer_input] 

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
      if @card_number < @deck_length
        @card_number += 1
      end
      @card = Card.find(@card_number)

    else
      @correct_guess_count += 1
      Round.update(@round.id, correct_guess_count: @correct_guess_count)

      @guess = Guess.create(
      answer_input: @user_answer, 
      card_id: @card_number, 
      round_id: @round.id, 
      )

      if @card_number < @deck_length
        @card_number += 1
      end      
      @card = Card.find(@card_number)  
    end
      
    if @card_number < @deck_length
      redirect_to deck_card_path(@deck.id, @card.id)
    else
      redirect_to '/'
    end
  end
end 





