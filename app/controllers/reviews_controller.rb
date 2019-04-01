class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_book
  before_action :authenticate_user!, only: %i(new edit create)

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id

    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  private

  def find_review
    @review = Review.find_by(id: params[:id])
  end

  def find_book
    @book = Book.find(params[:book_id])
    flash[:danger] = t ".not_found"
    redirect_back fallback_location: books_path
  end

  def review_params
    params.require(:review).permit(:rate, :content)
    flash[:danger] = t ".not_found"
    redirect_back fallback_location: books_path
  end
end
