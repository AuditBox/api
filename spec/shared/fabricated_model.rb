shared_examples 'a fabricated model' do
  let(:valid_subject) { Fabricate.build(described_class.name.underscore) }
  it 'should have a valid fabricator' do
    expect(valid_subject).to be_valid
  end
  it 'should persist a valid object' do
    valid_subject.save!
    expect(described_class.find(valid_subject.id)).to be_valid
  end
end
