#1. Tests infected introduction

Jean-Michel Garnier, <http://lyonrb.fr/> - apéro Ruby mai 2012

Built with <https://github.com/nakajima/slidedown>

#2. Histoire

* 1994: Kent Beck describes SUnit testing framework for Smalltalk
* 2001: <http://agilemanifesto.org/> + First test written by JM
* 2004: Rails
* 2006: BDD, RSpec
* 2011: travisci

##Links

* <http://guide.agilealliance.org/timeline.html>
* <http://21croissants.github.com/testing-rails-workshop>

#3. Vocabulaire

## Unit

## Integration

## Acceptance

#4. Anatomie RSpec

    require 'spec_helper'

    describe "Class" do
      before :each do
        # test data set up
      end

      describe "#method" do

        it "should specify the method under test behaviour" do
          # example and assertion using should
        end

      end

    end

##Links

* <http://blog.josephwilk.net/cucumber/examples-are-not-a-specification.html>
* <http://eggsonbread.com/2010/03/28/my-rspec-best-practices-and-tips/>
* <https://www.relishapp.com/rspec/>

#5. Example

    require 'spec_helper'

    describe Member do
      before :each do
        @member = Member.new
      end

      describe "to be valid" do

        it "requires at least a first name " do
          @member.first_name = "Guillaume"
          @member.valid?.should == true # One can also write: @member.should be_valid
        end

      end

    end


