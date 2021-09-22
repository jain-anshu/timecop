class Example
  def initialize
    m = 0
  end
  def time_plus_20
    t = 20.seconds.ago
    return Time.now - t
  end
end


describe Example do
  let(:ex) {  Example.new }

  it 'should return correct time value' do
    Timecop.freeze do
      expect(ex.time_plus_20).to eq(20)
    end
  end

  it 'wont return accurate value without timecop' do
    expect(ex.time_plus_20).to be_within(1).of(20)
  end
end

