require 'csv'
require 'net/http'
class UploaderController < ApplicationController
  after_action :notify_webhook, only: [:do_upload]
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

  def notify_webhook
    base_url = 'http://webhook.site/f2d3e621-7abd-41e5-a58c-915b6863ec89'

    url = URI.parse(base_url)
    req = Net::HTTP::Get.new(url.to_s)
    Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
  end
end
