require 'csv'
class UploaderController < ApplicationController
  def upload
  end

  def do_upload
    errors = []
    books = CSV.parse(params[:csv_file], headers: true)

    books.each do |book|
      unless book['title'] &&
        book['author'] &&
        book['date_published'] &&
        book['unique_identifier'] &&
        book['publisher_name']
        next
      end
      b = Book.new({
                     title: book['title'],
                     author: book['author'],
                     date_published: book['date_published'],
                     unique_identifier: book['unique_identifier'],
                     publisher_name: book['publisher_name'],
                     user_id: current_user.id,
                   })

      unless b.save
        errors << book['title']
        errors << b.errors.full_messages
      end
    end

    if errors.present?
      flash[:danger] = errors
    else
      flash[:success] = 'Import finished'
    end

    redirect_to  books_url
  end
end
