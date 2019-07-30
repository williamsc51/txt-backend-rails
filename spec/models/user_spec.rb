require 'rails_helper'

RSpec.describe User, type: :model do

  it "allow reading and writing to :fname" do
    subject.fname = 'Karl'
    expect(subject.fname).to eq('Karl')
  end

  describe "validation" do
    it { should validate_presence_of(:fname) }
    it { should validate_presence_of(:lname) }
  end 


end
