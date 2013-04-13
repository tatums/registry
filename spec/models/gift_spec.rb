require 'spec_helper'

describe Gift do

  let(:gift) { Gift.create!(title: 'Honey Moon', description: Faker::Lorem.paragraph, amount: 1000.00, portions: 10 ) }

  it 'Should respond to :title' do
    expect(gift).to respond_to :title
  end

  it 'Should have an array of contributions' do
    expect(gift.contributions.to_a).to be_an_instance_of Array
  end

  it 'Should calculate a portion amount' do
    expect( gift.portion_size ).to eq 100.0
  end

end
