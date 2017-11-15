require 'rails_helper'

describe Review do
  it { should validate_presence_of :rating }
  it { should validate_presence_of :review }
end
