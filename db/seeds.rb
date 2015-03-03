

5.times do |i|
  Sakane::Footage.create(
    title: "miniDV tape #{i}",
    date: Date.today,
    venue: "place #{i}",
    latitude: 10.1 * i,
    longitude: 12.2 * i,
    tags: "testag")
end