require "spec_helper"
require "tempfile"

module Paperclip
  describe Ghostscript do
    let(:file) { support_file("attachable.jpg") }
    let(:options) { Hash.new }
    let(:attachment) { nil }

    subject { Ghostscript.new(file, options, attachment) }

    describe "#make" do
      let(:command) { "gs" }
      let(:source_path) { file.path }
      let(:destination_path) { support_file_path("output.jpg") }
      let(:destination_file) { support_file("output.jpg") }
      let(:parameters) { "-dNOPAUSE -dBATCH -sDEVICE=jpeg -r144 -dUseCIEColor -dFirstPage=1 -dLastPage=1 -sOutputFile=:dest :source" }
      let(:run_options) {
        {
          source: source_path,
          dest: destination_path
        }
      }

      before do
        allow(Tempfile).to receive(:new).and_return(destination_file)
      end

      it "runs a Paperclip processor with all options" do
        expect(Paperclip).to receive(:run).with(command, parameters, run_options)
        expect(subject.make).to eq destination_file
      end

      context "when file is undefined" do
        let(:file) { nil }
        it { expect { subject.make }.to raise_error }
      end
    end
  end
end
