class BooksController < ApplicationController
  def index
  end

  def new
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	# ストロングパラメーターを使用
  	book = Book.new(book_params)
  	# DBへ保存
  	book.save
  	# 投稿詳細画面にリダイレクト
  	redirect_to book_path(book.id)
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
