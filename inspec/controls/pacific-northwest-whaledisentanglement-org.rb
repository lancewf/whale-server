title 'pacific-northwest.whaledisentanglement.org tests'

control 'pacific-northwest-whaledisentanglement-org' do
  impact 1.0
  title 'Pacific Northwest Whale Disentanglement site is verified'
  desc 'test that the pacific-northwest.whaledisentanglement.org is working'

  describe inspec.http("https://pacific-northwest.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">Pacific Northwest</h2>') } 
  end
  describe inspec.http("http://pacific-northwest.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">Pacific Northwest</h2>') } 
  end
end
