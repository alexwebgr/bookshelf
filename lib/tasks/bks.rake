namespace :bks do
  desc "create_books"
  task create_books: :environment do
    10.times do
      Book.create!({
                    title: FFaker::Book.title,
                    author: FFaker::Book.author,
                    date_published: FFaker::Time.datetime,
                    unique_identifier: FFaker::Guid.guid,
                    publisher_name: FFaker::Name.name,
                    user_id: 2,
                  })
    end
  end

end
