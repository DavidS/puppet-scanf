require 'spec_helper'

describe 'scanf' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "scanf class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('scanf::params') }
        it { is_expected.to contain_class('scanf::install').that_comes_before('scanf::config') }
        it { is_expected.to contain_class('scanf::config') }
        it { is_expected.to contain_class('scanf::service').that_subscribes_to('scanf::config') }

        it { is_expected.to contain_service('scanf') }
        it { is_expected.to contain_package('scanf').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'scanf class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('scanf') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
