class VotesController < ApplicationController
  before_action :authenticate_user!


  # def new
  #   @vote = Vote.new
  # end
  #
  # def edit
  #    @review = Review.find(params[:review_id])
  #    @vote = @review.votes.find(params[:id])
  # end
  #
  #
  # def create
  #   @vote = Vote.new(vote_params)
  #   respond_to do |format|
  #      format.js
  #   end
  #
  #
  # def update
  #   @review = Review.find(params[:review_id])
  #   @vote = @review.votes.find(params[:id])
  #     respond_to do |format|
  #        format.js
  #     end
  #
  # end
  #
  # def destroy
  #  @review = Review.find(params[:review_id])
  #  @vote = @review.votes.find(params[:id])
  #  @vote.destroy
  #
  # end
  #
  #
  # def vote_params
  #   params.require(:vote).permit(:count, :voted)
  # end
end
