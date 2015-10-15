require '../lib/connect_four.rb'

describe 'Player' do
	context "first player created" do
		it "creates first player with red piece" do
			player = Player.new(:red)
			expect(player.color).to eql :red
		end
	end

	context "second player created" do
		it "creates second player with black piece" do
			player = Player.new(:black)
			expect(player.color).to eql :black
		end
	end
end

describe 'Piece' do
	context "first player created" do
		it "creates the first player's piece" do
			piece = Piece.new(:r)
			expect(piece.player).to eql :r
		end
	end

	context "second player created" do
		it "creates the second player's piece" do
			piece = Piece.new(:b)
			expect(piece.player).to eql :b
		end
	end
end