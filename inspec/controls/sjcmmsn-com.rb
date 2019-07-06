title 'sjcmmsn.com tests'

control 'sjcmmsn-com' do
  impact 1.0
  title 'sjcmmsn.com is verified'
  desc 'test that the mmsn.com is working'

  describe inspec.http("https://sjcmmsn.com/") do
    its('status') { should eq(200) }
    its('body') { should match('<title>San Juan County Marine Mammal Stranding Network</title>') } 
  end
  describe inspec.http("https://www.sjcmmsn.com/") do
    its('status') { should eq(200) }
    its('body') { should match('<title>San Juan County Marine Mammal Stranding Network</title>') } 
  end
  describe inspec.http("http://sjcmmsn.com/", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<title>San Juan County Marine Mammal Stranding Network</title>') } 
  end
  describe inspec.http("http://www.sjcmmsn.com/", max_redirects: 2) do
    its('status') { should eq(200) }
    its('body') { should match('<title>San Juan County Marine Mammal Stranding Network</title>') } 
  end
  describe inspec.http("http://www.sjcmmsn.com/services/getVolunteers", max_redirects: 2) do
    its('status') { should eq(200) }
  end
  describe "Volunteers" do
    subject do
      JSON.parse(inspec.http("http://www.sjcmmsn.com/services/getVolunteers", max_redirects: 2).body, symbolize_names: true)
    end
    its('length') { should be > 100 }
    it "Has correct volunteer" do
      expect(subject.index { |v| v[:first_name] == "Lance" && v[:last_name] == "Finfrock" } >= 0).to be true
    end
  end
  describe inspec.http("https://www.sjcmmsn.com/services/getReports") do
    its('status') { should eq(200) }
  end
  describe "Reports" do
    subject do
      JSON.parse(inspec.http("https://www.sjcmmsn.com/services/getReports").body, symbolize_names: true)
    end
    its('length') { should be > 100 }
  end
  describe inspec.http("https://www.sjcmmsn.com/services/getIslands") do
    its('status') { should eq(200) }
  end
end
