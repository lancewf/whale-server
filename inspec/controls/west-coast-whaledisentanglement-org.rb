title 'west-coast.whaledisentanglement.org tests'

control 'west-coast-whaledisentanglement-org' do
  impact 1.0
  title 'West Coast Whale Disentanglement site is verified'
  desc 'test that the west-coast.whaledisentanglement.org is working'

  describe inspec.http("https://west-coast.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">West Coast</h2>') } 
  end
  describe inspec.http("http://west-coast.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">West Coast</h2>') } 
  end
end
