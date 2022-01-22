class PagesController < ApplicationController
  before_action :user_authorized?, only: [:new_review]
  def main

  end

  def reviews
    @reviews = Review.all
    cookies[:rating] = 0
  end

  def new_review
    review = Review.new(mark: cookies[:rating], comment: params[:review][0])
    review.user = current_user
    if review.save
      flash[:notice] = "Review successfully added"
      redirect_to pages_reviews_path
    else
      flash[:alert] = "Errors occurred while saving feedback"
      redirect_to pages_reviews_path
    end
  end


private
  def user_authorized?
    unless current_user
      flash[:alert] = "You must be signed in to leave a review"
      redirect_to pages_reviews_path
    end
  end



end
