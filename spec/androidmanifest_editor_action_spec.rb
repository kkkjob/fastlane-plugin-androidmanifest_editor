describe Fastlane::Actions::AndroidmanifestEditorAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The androidmanifest_editor plugin is working!")

      Fastlane::Actions::AndroidmanifestEditorAction.run(nil)
    end
  end
end
