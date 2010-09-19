class CommentsController < ApplicationController

  before_filter :find_all_comments
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @comment in the line below:
    present(@page)
  end

  def show
    @comment = Comment.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @comment in the line below:
    present(@page)
  end

protected

  def find_all_comments
    @comments = Comment.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/comments")
  end

end
