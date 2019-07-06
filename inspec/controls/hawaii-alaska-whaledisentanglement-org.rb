title 'hawaii-alaska.whaledisentanglement.org tests'

control 'hawaii-alaska-whaledisentanglement-org' do
  impact 1.0
  title 'Hawaii Alaska Whale Disentanglement site is verified'
  desc 'test that the hawaii-alaska.whaledisentanglement.org is working'

  describe inspec.http("https://hawaii-alaska.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">Hawaii and Alaska</h2>') }
  end
  describe inspec.http("http://hawaii-alaska.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">Hawaii and Alaska</h2>') } 
  end
end
