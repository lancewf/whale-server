title 'media.whaledisentanglement.org tests'

control 'media-whaledisentanglement-org' do
  impact 1.0
  title 'Media Whale Disentanglement site is verified'
  desc 'test that the media.whaledisentanglement.org is working'

  describe inspec.http("https://media.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">Media</h2>') } 
  end
  describe inspec.http("http://media.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">Media</h2>') } 
  end
end
