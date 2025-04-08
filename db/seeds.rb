puts "Creating posts..."
Post.create!(title: "First Post from Seed", content: "This is the content of the first post.")
Post.create!(title: "React Integration", content: "Fetching this data from Rails!")
Post.create!(title: "Another Example", content: "Content goes here.")

puts "Finished seeding!"