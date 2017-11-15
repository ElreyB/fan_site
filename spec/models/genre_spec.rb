require 'rails_helper'

describe Genre do
  it { should validate_presence_of :name }
end
