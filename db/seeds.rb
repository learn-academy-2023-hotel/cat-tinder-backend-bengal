cats = [
    {
        name: 'Blackwell',
        age: 4,
        enjoy: 'long walks on the beach',
        image: 'https://twitter.com/susantananda3/status/1330866962675625988/photo/1'
    },
    {
        name: 'Ash',
        age: 6,
        enjoy: 'eating catnip',
        image: 'https://images.unsplash.com/photo-1513617753818-29509cdfdd9d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
    {
        name: 'Badger',
        age: 5,
        enjoy: 'a nice long nap',
        image: 'https://as2.ftcdn.net/v2/jpg/05/87/92/55/1000_F_587925530_VUYOLH6hI9RALjteSJo4T7gqYgHft9C2.jpg'
    }
]

cats.each do |cat|
    Cat.create cat
    puts "creating cat #{cat}"
end