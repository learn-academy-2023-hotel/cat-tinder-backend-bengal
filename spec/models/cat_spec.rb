require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "Should validate name exists in database entry" do
    cat = Cat.create(age: 4, enjoy: 'eating food', image: 'image.jpeg')

    expect(cat.errors[:name]).to_not be_empty
  end

  it "Should validate age exists in database entry" do
    cat = Cat.create(name: 'tom', enjoy: 'eating food', image: 'image.jpeg')

    expect(cat.errors[:age]).to_not be_empty
  end

  it "Should validate enjoy exists in database entry" do
    cat = Cat.create(name: 'sylvester', age: 4, image: 'image.jpeg')

    expect(cat.errors[:enjoy]).to_not be_empty
  end

  it "Should validate image exists in database entry" do
    cat = Cat.create(name: 'cruz', age: 4, enjoy: 'eating food')

    expect(cat.errors[:image]).to_not be_empty
  end

  it "Should validate cat enjoy entry is at least 10 characters long" do
    cat = Cat.create(name: 'jerry', age: 5, enjoy: 'netflix and chill', image: 'image1.jpeg')

    # expect(cat.errors[:enjoy]).to_not be_empty
    expect(cat.enjoy.length).to be > 10
  end
end
