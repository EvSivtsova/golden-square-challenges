require "time_error"

describe TimeError do
  it "returns the difference between the remove clock and local clock" do
    fake_requester = double :requester
    expect(fake_requester).to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return('{"abbreviation":"BST","client_ip":"188.28.107.157","datetime":"2022-06-24T16:21:12.917296+01:00","day_of_week":5,"day_of_year":175,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1656084072,"utc_datetime":"2022-06-24T15:21:12.917296+00:00","utc_offset":"+01:00","week_number":25}')
    time = Time.new(2022, 6, 24, 16, 21, 12)
    time_error = TimeError.new(fake_requester)
    result = time_error.error(time)
    expect(result).to eq 0.917296
  end
end