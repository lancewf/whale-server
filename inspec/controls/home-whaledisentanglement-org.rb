title 'home whaledisentanglement.org tests'

control 'home whaledisentanglement-org' do
  impact 1.0
  title 'Whale Disentanglement home site is verified'
  desc 'test that the home whaledisentanglement.org is working'

  describe inspec.http("https://whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<title>Network Location</title>') } 
  end
  describe inspec.http("http://whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<title>Network Location</title>') } 
  end
  describe inspec.http("https://www.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<title>Network Location</title>') } 
  end
  describe inspec.http("http://www.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<title>Network Location</title>') } 
  end
end
