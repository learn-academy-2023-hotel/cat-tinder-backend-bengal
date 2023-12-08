class Cat < ApplicationRecord
    validates :name, :age, :enjoy, :image, presence: true
    validates :enjoy, length: {minimum:10}
end
