name 'yum_dag'
maintainer 'Jared Barnett'
maintainer_email 'jared.barnett@gmail.com'
license 'all_rights'
description 'Used to create a graph of yum repositories'
long_description 'Chef cookbook for creating a directed acyclic graph of yum repositories. I suppose you *could* create a cycle in your graph, but why would you?'
version '0.1.3'

depends 'yum', '~> 3.10.0'
depends 'httpd', '~> 0.2'