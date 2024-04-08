require 'spec_helper'

fixture_path = 'spec/fixtures'

describe 'load basic CSV file' do

  it 'should work when requested with unmodified headers' do
    options = { header_transformations: [:none] }
    data = SmarterCSV.process("#{fixture_path}/basic.csv", options)
    data.size.should eq 5

    # all the keys should be symbols
    data.each{|item| item.keys.each{|x| x.class.should eq String}}

    data.each do |h|
      h.keys.each do |key|
        ["First Name", "Last Name", "Dogs", "Cats", "Birds", "Fish"].should include( key )
      end
      h.size.should <= 6
    end
  end

  it 'should work when requested with unmodified headers' do
    options = { defaults: :no_procs }
    data = SmarterCSV.process("#{fixture_path}/basic.csv", options)
    data.size.should eq 5

    # all the keys should be symbols
    data.each{|item| item.keys.each{|x| x.class.should eq String}}

    data.each do |h|
      h.keys.each do |key|
        ["First Name", "Last Name", "Dogs", "Cats", "Birds", "Fish"].should include( key )
      end
      h.size.should <= 6
    end
  end

  it 'should work with v1 defaults' do
    data = SmarterCSV.process("#{fixture_path}/basic.csv", {defaults: 'v1'})
    data.size.should eq 5

    # all the keys should be symbols
    data.each{|item| item.keys.each{|x| x.class.should eq Symbol}}
    data.each do |h|
      h.keys.each do |key|
        [:first_name, :last_name, :dogs, :cats, :birds, :fish].should include( key )
      end
      h.size.should <= 6
    end
  end

  it 'should work with new defaults' do
    data = SmarterCSV.process("#{fixture_path}/basic.csv", {})
    data.size.should eq 5

    # all the keys should be symbols
    data.each{|item| item.keys.each{|x| x.class.should eq Symbol}}
    data.each do |h|
      h.keys.each do |key|
        [:first_name, :last_name, :dogs, :cats, :birds, :fish].should include( key )
      end
      h.size.should <= 6
    end
  end
end
