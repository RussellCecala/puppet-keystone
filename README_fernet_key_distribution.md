# README - Fernet Key distribution and rotation

This change modifies (openstack/puppet-keystone stable/newton branch)[https://github.com/openstack/puppet-keystone/tree/stable/newton]
in such a way that fernet keys get distributed from a central location (the fernet_key_master) to all controller nodes.

`puppet agent -t` must be run twice on the first controller node before running `puppet agent -t` 
on any other controller node during the initial deployment of a Newton Openstack cloud.

The first `puppet agent -t` run will allow puppet to generate the initial set of fernet keys.
The second `puppet agent -t` run will allow the custom fact code to create the fernet_keys fact
and to export the fernet key File resources.

# Additional Documentation

  These modification based on information available on these web pages:

  https://developer.ibm.com/opentech/2015/11/11/deep-dive-keystone-fernet-tokens/
   
