

range = 1..100

range.each do |i|
  Sakane::Footage.create(
    title: "miniDV tape #{i}",
    date: Date.today,
    venue: "place #{i}",
    latitude: 10.1 * i,
    longitude: 12.2 * i,
    tags: "testag")
end
