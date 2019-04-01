class BooksController < ApplicationController
  authorize_resource
  before_action :get_categories, only: %i(index new create edit update)
  before_action :get_book, only: %i(edit show update)

  def index
    @books = Book.includes(:category).page(params[:page])
                 .per Settings.book_in_page
  end

  def show
    @reviews = Review.where(book_id: @book.id).order("created_at DESC")
    @average_review1 = Review.sum(:rate)

    if @reviews.blank?
      @average_review = 0
    else
      @average_review = @reviews.average(:rate).round(2)
    end
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = Book.new book_params

    if @book.save
      flash[:success] = t ".create_success"
      redirect_to books_path
    else
      flash.now[:danger] = t ".create_failure"
      render :new
    end
  end

  def edit; end

  def update
    if @book.update book_params
      flash[:success] = t ".update_success"
      redirect_to books_path
    else
      flash.now[:danger] = t ".update_failure"
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit :title, :cover_image, :description,
      :number_pages, :publish_date, :price, :author, :category_id
  end

  def get_categories
    @categories = Category.pluck :name, :id
  end

  def get_book
    return if @book = Book.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_back fallback_location: books_path
  end
end
