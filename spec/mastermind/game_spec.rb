require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  describe Game do
    before(:each) do
      @messenger = mock("messenger").as_null_object
      @game      = Game.new(@messenger)
    end

    context "starting up" do
      it "should send a welcome message (passing the code to start)" do
        @messenger.should_receive(:puts).with("Welcome to Mastermind!")
        @game.start(%w[r g y c])
      end

      it "should prompt us for the first guess" do
        @messenger.should_receive(:puts).with("Enter guess:")
        @game.start(%w[r g y c])
      end
    end

    context "marking a guess" do
      context "with all 4 colors correct in the correct places" do
        it "should mark the guess with bbbb" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbbb")
          @game.guess(%w[r g y c])
        end
      end

      context "with all 4 colors correct and 2 in the correct places" do
        it "should mark the guess with bbww" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbww")
          @game.guess(%w[r g c y])
        end
      end

      context "with all 4 colors correct and 1 in the correct places" do
        it "should mark the guess with bwww" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bwww")
          @game.guess(%w[y r g c])
        end
      end

      context "with only 3 colors correct in the correct places" do
        it "should mark the guess with bbb" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbb")
          @game.guess(%w[w g y c])
        end
      end

      context "with only 3 colors correct and 2 in the correct places" do
        it "should mark the guess with bbw" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbw")
          @game.guess(%w[w r y c])
        end
      end

      context "with only 3 colors correct and 1 in the correct places" do
        it "should mark the guess with bww" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bww")
          @game.guess(%w[w r g c])
        end
      end

      context "with only 3 colors correct and 0 in the correct places" do
        it "should mark the guess with www" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("www")
          @game.guess(%w[w r g y])
        end
      end

      context "with only 2 colors correct in the correct places" do
        it "should mark the guess with bb" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bb")
          @game.guess(%w[w g w c])
        end
      end

      context "with only 2 colors correct and 1 in the correct places" do
        it "should mark the guess with bw" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bw")
          @game.guess(%w[w r w c])
        end
      end

      context "with only 2 colors correct and 0 in the correct places" do
        it "should mark the guess with ww" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("ww")
          @game.guess(%w[g w c w])
        end
      end

      context "with only 1 color correct in the correct place" do
        it "should mark the guess with b" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("b")
          @game.guess(%w[r w w w])
        end
      end

      context "with only 1 color correct and 0 in the correct place" do
        it "should mark the guess with w" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("w")
          @game.guess(%w[w w r w])
        end
      end

      context "with duplicates in the guess that match a peg in the code" do
        context "by color and position" do
          it "should add a single b to the mark" do
            #pending("writing the logic to account for this")
            @game.start(%w[r y g c])
            @messenger.should_receive(:puts).with("bbb")
            @game.guess(%w[r y g g])
          end
        end
      end
    end

  end # end Game
end
