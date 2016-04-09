# Travis notes

## Installing

The `./install_php_extension.sh` script allows to easily download, install, configure the php_excel extension on Travis.

For reference take a look at the official [php_excel repo](https://github.com/iliaal/php_excel). 
Note that, as of April 2016, the php7 version of the extension is only available in this [branch/repository](https://github.com/johmue/php_excel/tree/php7)._

In order to install, just run

```console
$ ./install_php_excel_extension.sh [php5|php7]
``` 

The add the `extension=excel.so` in your php.ini config.
