name             'vim-fully-build'
maintainer       'ᑎɑղօԹíϲօ(nanopico)'
maintainer_email 'nanopico.san@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures vim'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(ubuntu).each do |os|
  supports os
end
