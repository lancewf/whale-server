title 'pacific-islands-training.whaledisentanglement.org tests'

control 'pacific-islands-training-whaledisentanglement-org' do
  impact 1.0
  title 'Pacific Islands training site is verified'
  desc 'test that the pacific-islands-training.whaledisentanglement.org is working'

  describe inspec.http("https://pacific-islands-training.whaledisentanglement.org", max_redirects: 1) do
    its('status') { should eq(200) }
    its('body') { should match('<title>U.S. Whale Entanglement Response Level 1 - Pacific Islands Region</title>') } 
  end
  describe inspec.http("http://pacific-islands-training.whaledisentanglement.org", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<title>U.S. Whale Entanglement Response Level 1 - Pacific Islands Region</title>') } 
  end
end
