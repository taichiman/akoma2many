
RSpec.describe 'xml2hdojson' do
  context 'main workflow' do
    it 'create 2 files' do
      tmp_dir = `mktemp -d --suffix _ruby_hdo`.strip
      FileUtils.cp("spec/stuff/mainflow/acta-02-12-julio-31-de-2012-f.xml", "#{tmp_dir}/")
      FileUtils.cp("spec/stuff/mainflow/acta-23-12-noviembre-28-de-2012.xml", "#{tmp_dir}/")

      `xml2hdojson #{tmp_dir}/*.xml`

      expect(Dir.exist?("#{tmp_dir}/acta-02-12-julio-31-de-2012-f.json")).to be_truthy
      expect(Dir.exist?("#{tmp_dir}/acta-23-12-noviembre-28-de-2012.json")).to be_truthy

      #test to script exit code

    end
  end
end

