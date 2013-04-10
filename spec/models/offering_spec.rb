require 'spec_helper'

describe Offering do

  let(:offering) { Offering.create!(title: 'Honey Moon', description: Faker::Lorem.paragraph, amount: 1000.00, portions: 10 ) }

  it 'Should respond to :title' do
    expect(offering).to respond_to :title
  end

  it 'Should have an array of contributions' do
    expect(offering.contributions.to_a).to be_an_instance_of Array
  end

  it 'Should calculate a portion amount' do
    expect( offering.portion_size ).to eq 100.0
  end

end
