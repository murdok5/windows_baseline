class profile::windows::baseline {
  include profile::windows::chocolatey


  Package {
    ensure   => installed,
    provider => chocolatey,
    require  => Class['chocolatey'],
  }

  package { 'Firefox': }

  package { 'notepadplusplus': }

  package { '7zip': }

  package { 'git': }

  windows_firewall::exception { 'TSErule':
    ensure       => present,
    direction    => 'in',
    action       => 'Allow',
    enabled      => 'yes',
    protocol     => 'TCP',
    local_port   => '8080',
    display_name => 'TSE PUPPET DEMO',
    description  => 'Inbound rule example for demo purposes',
  }



}
