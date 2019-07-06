title 'alaska-training.whaledisentanglement.org tests'

control 'alaska-training-whaledisentanglement-org' do
  impact 1.0
  title 'Alaska training site is verified'
  desc 'test that the alaska-training.whaledisentanglement.org is working'

  describe inspec.http("https://alaska-training.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<title>U.S. Whale Entanglement Response Level 1 - Alaska Region</title>') } 
  end
  describe inspec.http("http://alaska-training.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<title>U.S. Whale Entanglement Response Level 1 - Alaska Region</title>') } 
  end
end
