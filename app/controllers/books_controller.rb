class BooksController < ApplicationController
  #add callback
  before_action :set_book, only: [:edit, :update, :show, :destroy]

  def index
    if params[:category].blank?
      @books = Book.all.order("created_at DESC")
    else
      @category_id = Category.find_by(category_name: params[:category]).id
      @books = Book.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def new
    @book = current_user.books.build
    @categories = Category.all.map{ |c| [c.category_name, c.id] }
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:notice] = "Book Has Been Created Successfully!"
      redirect_to books_path
    else
      flash[:error] = "Create Operation Has Been Failed!"
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Book Has Been Updated Successfully!"
      redirect_to books_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:book_title, :book_description, :author, :category_id)
    end
end
