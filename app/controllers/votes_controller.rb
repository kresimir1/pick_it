class VotesController < ApplicationController
  before_action :authenticate_user!

  before_action :authenticate_user!

    def create
      @review = Review.find(vote_params[:review_id])
      @product = @review.product
      @vote = Vote.find_by(user_id: current_user.id, review_id: @review.id)
      user_input = vote_params[:count].to_i

      if @vote
        if @vote.count == 0

          @vote.count = user_input
          @vote.save
          flash[:notice] = "Your vote has been updated!"
          redirect_to @product
        else
          if @vote.count == user_input

            flash[:notice] = "You can only vote once!"
            redirect_to product_path(@product)
          else
            @vote.count = 0
            @vote.save

            flash[:notice] = "Your vote has been updated!"
            redirect_to product_path(@product)
          end
        end
      else
        @vote = Vote.create(vote_params)

        flash[:alert] = "Thank you for your vote!"
        redirect_to product_path(@product)
      end
    end

    private

    def vote
      @vote ||= Vote.find_by(user_id: vote[:user_id], review_id: vote[:review_id])
    end

    def vote_params
      params.require(:vote).permit(:user_id, :review_id, :count)
    end
end
