[![Build Status](https://travis-ci.org/littlekbt/mackerel-metadata-plugin-language-version.svg?branch=master)](https://travis-ci.org/littlekbt/mackerel-metadata-plugin-language-version)

# mackerel-metadata-plugin-language-version

mackerel-metadata-plugin-language-version is mackerel metadata plugin.  
This plugin collects programming language version on host.

## description
mackerel-metadata-plugin-language-version plugin collects programming language version on host.  
This helps that administorator discovers host using fragilitas language version or EoL language version.  

This supports ruby, php, python, golang by default.
By making json file under config direcoty, you can add other language version info to metadata.  

## Example output
```
ruby main.rb
#=> "[{\"ruby\":\"2.3.0p0\"},{\"php\":\"5.6.30\"},{\"python\":\"2.7.13\"},{\"golang\":\"1.8.2\"}]"
```

or you can filter
```
ruby main.rb ruby php
#=> "[{\"ruby\":\"2.3.0p0\"},{\"php\":\"5.6.30\"}]"
```

## Example of json file

```
{
  "golang": {
    "version": "go version",
    "parser": "go\\sversion\\sgo(.*?)\\s"
  }
}
```

version value must be command that output language version.  
perser value must be regular expression that have to capture you want to register metadata.
(regular exporession is interpreted by ruby)

## Example of mackerel-agent.conf

```
[plugin.metadata.language_version]
command = "ruby /path/to/mackerel-metadata-plugin-language-version/main.rb"
execution_interval = 60
```
