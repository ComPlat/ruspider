# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ruspider do
  it 'has a version number' do
    expect(Ruspider::VERSION).not_to be nil
  end

  it 'has ChemSpider' do
    expect(Ruspider::ChemSpider).not_to be nil
  end
end
