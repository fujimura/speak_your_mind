# speak_your_mind
rspec-like output for Shoulda/Test::Unit. 

## Usage
`require 'speak_your_mind` in test_helper and run them.
if the test code was 
    context "Test" do

      should 'success' do 
        assert true 
      end 

      should 'fail' do 
        assert false 
      end 

      should 'error' do 
        raise
      end 
, result will be 
    E Test should error.
    F Test should fail.
    . Test should success.
with color.

## Installation
gem install speak_your_mind

Copyright (c) 2010 fujimura. See LICENSE for details.
