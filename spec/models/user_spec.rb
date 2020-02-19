# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  fname                  :string
#  lname                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  authentication_token   :string(30)
#  admin                  :boolean          default(FALSE)
#

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
