class BooksController < ApplicationController
  after_action :verify_authorized
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :load_collections, only: [:new, :edit]

  # GET /books or /books.json
  def index
    authorize Book
    @books = Book.all
  end

  def books_loan
    authorize Book
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    authorize Book
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    authorize Book
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def wish_list
    authorize Book
    @books = []

    if current_user.admin?
      @books = Book.all
    else
      @books = Book.wished_by(current_user.id)
    end
  end

  def marked_whis
    @wish_list = WishList.create(user_id: params[:user_id], book_id: params[:book_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      authorize Book
      @book = Book.find(params[:id])
    end

    def load_collections
      @authors = Author.all
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :description, :isbn, :price, :stock, :book_score, :score, :photo, :author_id)
    end
end
