# frozen_string_literal: true

require 'spec_helper'

describe 'firewall::linux::debian', type: :class do
  context 'with Debian 10' do
    let(:facts) do
      {
        osfamily: 'Debian',
        operatingsystem: 'Debian',
        operatingsystemrelease: '10.0',
      }
    end

    it {
      is_expected.to contain_package('iptables-persistent').with(
        ensure: 'installed',
      )
    }
    it {
      is_expected.to contain_service('netfilter-persistent').with(
        ensure: nil,
        enable: 'true',
        require: 'Package[iptables-persistent]',
      )
    }
  end

  context 'with Debian 10, enable => false' do
    let(:facts) do
      {
        osfamily: 'Debian',
        operatingsystem: 'Debian',
        operatingsystemrelease: '10',
      }
    end
    let(:params) { { enable: 'false' } }

    it {
      is_expected.to contain_service('netfilter-persistent').with(
        enable: 'false',
      )
    }
  end

  context 'with Debian 11' do
    let(:facts) do
      {
        osfamily: 'Debian',
        operatingsystem: 'Debian',
        operatingsystemrelease: '11.0',
      }
    end

    it {
      is_expected.to contain_package('iptables-persistent').with(
        ensure: 'installed',
      )
    }
    it {
      is_expected.to contain_service('netfilter-persistent').with(
        ensure: nil,
        enable: 'true',
        require: 'Package[iptables-persistent]',
      )
    }
  end

  context 'with Debian 11, enable => false' do
    let(:facts) do
      {
        osfamily: 'Debian',
        operatingsystem: 'Debian',
        operatingsystemrelease: '11',
      }
    end
    let(:params) { { enable: 'false' } }

    it {
      is_expected.to contain_service('netfilter-persistent').with(
        enable: 'false',
      )
    }
  end

  context 'with Debian unstable' do
    let(:facts) do
      {
        osfamily: 'Debian',
        operatingsystem: 'Debian',
        operatingsystemrelease: 'unstable',
      }
    end

    it {
      is_expected.to contain_package('netfilter-persistent').with(
        ensure: 'installed',
      )
    }
    it {
      is_expected.to contain_service('netfilter-persistent').with(
        ensure: nil,
        enable: 'true',
        require: 'Package[netfilter-persistent]',
      )
    }
  end
end
