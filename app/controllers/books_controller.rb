class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def new
  end

  def create
  	# ストロングパラメーターを使用
  	@book = Book.new(book_params)
  	# 保存
  	@book.save
  	# 投稿詳細画面にリダイレクト
  	if @book.save
  	redirect_to book_path(@book.id),notice: "Book was successfully created."
  	  else
  	  	@books = Book.all
  	  	render action: :index
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	if @book.update(book_params)
  	redirect_to book_path(@book.id), notice: "Book was successfully updated."
  	  else
  	  	@books = Book.new
  	  	render action: :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end


