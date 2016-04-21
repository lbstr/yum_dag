# yum_dag Cookbook

Chef cookbook for creating a directed acyclic graph ([DAG](https://en.wikipedia.org/wiki/Directed_acyclic_graph)) of yum repositories. I suppose you *could* create a cycle in your graph, but why would you?

## Requirements

### Cookbooks

* yum
* httpd

### Packages

* httpd
* createrepo

## Attributes

* _['yum_dag']['local_repo']['id']_
  _Type:_ String
  _Description:_ The ID of the local yum repository
  _Default:_ "local"
* _['yum_dag']['local_repo']['location']_
  _Type:_ String
  _Description:_ The location of the local yum repository
  _Default:_ "/var/www/yum"
* _['yum_dag']['local_repo']['description']_
  _Type:_ String
  _Description:_ A description and friendly name for the local yum repository
  _Default:_ "Local"
* _['yum_dag']['seed_packages']['repotrack']_
  _Type:_ Array of String
  _Description:_ Packages that should be downloaded via repotrack. These packages will be placed in the local yum repository.
  _Default:_ *None*
* _['yum_dag']['upstreams']_
  _Type:_ Array of Object
  _Description:_ Upstreams that the current node should connect to. The node will issue a reposync command to all upstreams in order to pull all of their packages into the local repository. 
  _Default:_ *None*
* _['yum_dag']['upstreams'][n]['repoid']_
  _Type:_ String
  _Description:_ The ID of the upstream yum repository
  _Default:_ *None*
* _['yum_dag']['upstreams'][n]['description']_
  _Type:_ String
  _Description:_ A description and friendly name for the upstream yum repository
  _Default:_ *None*
* _['yum_dag']['upstreams'][n]['baseurl']_
  _Type:_ String
  _Description:_ A url for the upstream yum repository. http, file, and ftp protocols are acceptable. [See more here](https://www.centos.org/docs/5/html/5.2/Deployment_Guide/s1-yum-yumconf-repository.html). 
  _Default:_ *None*

## Usage

**TODO**

## LWRP

**Coming in the future...*