Post.destroy_all
Comment.destroy_all

50.times do

    created_at = Faker::Date.backward(days: 365 * 5)

    p = Post.create(
    title: Faker::Lorem.sentence(word_count: 5),
    body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),
    updated_at: created_at
    )
    if p.valid? 
        rand(1..5).times do 
            Comment.create(body: Faker::Hacker.say_something_smart, post: p)
        end
    end

end

posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{posts.count} posts.", :elephant)
puts Cowsay.say("Generated #{comments.count} comments.", :frogs)
