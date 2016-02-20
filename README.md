vim-fully-build Cookbook
========================

Build vim to the utmost extent.

Support platforms
------------
Ubuntu

Attributes
----------
#### vim-fully-build::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['vim-fully-build']['user']</tt></td>
    <td>String</td>
    <td>Build user</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['vim-fully-build']['group']</tt></td>
    <td>String</td>
    <td>Build group</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['vim-fully-build']['source-directory']</tt></td>
    <td>String</td>
    <td>Directory where clone source files from git</td>
    <td><tt>/usr/local/src</tt></td>
  </tr>
  <tr>
    <td><tt>['vim-fully-build']['prefix']</tt></td>
    <td>String</td>
    <td>Prefix</td>
    <td><tt>/usr/local</tt></td>
  </tr>
</table>

Usage
-----
#### vim-fully-build::default
Just include `vim-fully-build` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vim-fully-build]"
  ]
}
```

Contributing
------------

License and Authors
-------------------
License: Apache 2.0
Authors: ᑎɑղօԹíϲօ(nanopico)

