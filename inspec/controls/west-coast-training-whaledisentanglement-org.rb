title 'west-coast-training.whaledisentanglement.org tests'

control 'west-coast-training-whaledisentanglement-org' do
  impact 1.0
  title 'West Coast training site is verified'
  desc 'test that the west-coast-training.whaledisentanglement.org is working'

  describe inspec.http("https://west-coast-training.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<title>U.S. Whale Entanglement Response</title>') } 
  end
  describe inspec.http("http://west-coast-training.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<title>U.S. Whale Entanglement Response</title>') } 
  end
end
