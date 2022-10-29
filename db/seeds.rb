Post.destroy_all

50.times do

    created_at = Faker::Date.backward(days: 365 * 5)

    Post.create(
    title: Faker::TvShows::Seinfeld.quote,
    body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),
    updated_at: created_at
    )

end

posts = Post.all
puts Cowsay.say("Generated #{posts.count} posts.", :elephant)
