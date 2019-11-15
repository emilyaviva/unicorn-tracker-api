require 'rails_helper'

RSpec.describe Unicorn, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:food) }
  it { should validate_presence_of(:location) }
end
