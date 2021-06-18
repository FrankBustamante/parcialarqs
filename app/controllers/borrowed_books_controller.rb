class BorrowedBooksController < ApplicationController
  after_action :verify_authorized
  before_action :set_borrowed_book, only: %i[ show edit update destroy ]

  # GET /borrowed_books or /borrowed_books.json
  def index
    authorize BorrowedBook
    @borrowed_books = BorrowedBook.all
  end

  def user
    authorize BorrowedBook
    @borrowed_books = BorrowedBook.where(user_id: current_user.id)
  end

  # GET /borrowed_books/1 or /borrowed_books/1.json
  def show
  end

  # GET /borrowed_books/new
  def new
    authorize BorrowedBook
    @borrowed_book = BorrowedBook.new
  end

  # GET /borrowed_books/1/edit
  def edit
  end

  # POST /borrowed_books or /borrowed_books.json
  def create
    authorize BorrowedBook
    @borrowed_book = BorrowedBook.new(borrowed_book_params)

    respond_to do |format|
      if @borrowed_book.save
        if current_user.book_score < @borrowed_book.book.book_score
          @borrowed_book.cancelado!
        end
        format.html { redirect_to user_borrowed_books_path, notice: "Borrowed book was successfully created." }
        format.json { render @borrowed_book, status: :created, location: @borrowed_book }
      else
        format.html { render books_loan_books_path, status: :unprocessable_entity }
        format.json { render json: @borrowed_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrowed_books/1 or /borrowed_books/1.json
  def update
    respond_to do |format|
      if @borrowed_book.update(borrowed_book_params)
        format.html { redirect_to @borrowed_book, notice: "Borrowed book was successfully updated." }
        format.json { render :show, status: :ok, location: @borrowed_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrowed_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowed_books/1 or /borrowed_books/1.json
  def destroy
    @borrowed_book.destroy
    respond_to do |format|
      format.html { redirect_to borrowed_books_url, notice: "Borrowed book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowed_book
      authorize BorrowedBook
      @borrowed_book = BorrowedBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrowed_book_params
      params.require(:borrowed_book).permit(:book_id, :user_id, :status, :limit_date, :return_date)
    end
end
