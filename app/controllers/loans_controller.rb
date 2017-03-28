class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :update]
  before_action :set_available_books, only: [:new, :show, :update]

  def index
    @books = Book.borrowed
  end

  def book_return
    book = Book.find params[:id]
    @loan = Loan.find_by(book: book)
    
    if @loan.destroy
      book.available! # Make book available again after return it
      redirect_to loans_path, notice: "Loan has been successfuly destroyed"
    end
  end

  def new
    @loan = Loan.new
    @users = User.all
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      if @loan.book.borrowed! # change status
        redirect_to loan_path(@loan), notice: "Loan has been successfuly created"
      end
    else
      redirect_to new_loan_path, alert: "Loan has not been created"
    end
  end

  def show
  end

  def update
    @user = @loan.user
    params[:loan]["user_id"] = @user.id
    @loan = Loan.new(loan_params)


    if @loan.save
      if @loan.book.borrowed! # change status
        redirect_to loan_path(@loan), notice: "Loan has been successfuly updated"
      end
    else
      redirect_to new_loan_path, alert: "Loan has not been updated"
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def set_available_books
    @books = Book.available
  end

  def loan_params
    params.require(:loan).permit(:user_id, :book_id)
  end
end
