# frozen_string_literal: true

require 'spec_helper'

fixture_path = 'spec/fixtures'

describe 'can handle the difficult CSV file' do
  it 'loads the data with default values' do
    data = SmarterCSV.process("#{fixture_path}/hard_sample.csv")
    data.size.should eq 1
    item = data.first
    item.keys.count.should == 48
    item[:name].should == '#MR1220817'
    item[:shipping_method].should == 'Livraison Standard GRATUITE, 2-5 jours avec suivi'
    item[:lineitem_name].should == 'Cire Épilation Nacrée'
    item[:phone].should == 3366012111111
  end

  # the main problem is the data line starting with a # character, but not being a comment
  it 'fails to load the CSV file with incorrectly set comment_regexp' do
    options = {comment_regexp: /\A#/ }
    data = SmarterCSV.process("#{fixture_path}/hard_sample.csv", options)
    data.size.should eq 0
  end
end
