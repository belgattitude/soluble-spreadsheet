# soluble/spreadsheet

[![PHP Version](http://img.shields.io/badge/php-5.5+-ff69b4.svg)](https://packagist.org/packages/soluble/spreadsheet)
[![Build Status](https://travis-ci.org/belgattitude/soluble-spreadsheet.png?branch=master)](https://travis-ci.org/belgattitude/soluble-spreadsheet)
[![Code Coverage](https://scrutinizer-ci.com/g/belgattitude/soluble-spreadsheet/badges/coverage.png?s=aaa552f6313a3a50145f0e87b252c84677c22aa9)](https://scrutinizer-ci.com/g/belgattitude/soluble-spreadsheet)
[![Scrutinizer Quality Score](https://scrutinizer-ci.com/g/belgattitude/soluble-spreadsheet/badges/quality-score.png?s=6f3ab91f916bf642f248e82c29857f94cb50bb33)](https://scrutinizer-ci.com/g/belgattitude/soluble-spreadsheet)
[![Latest Stable Version](https://poser.pugx.org/soluble/spreadsheet/v/stable.svg)](https://packagist.org/packages/soluble/spreadsheet)
[![Total Downloads](https://poser.pugx.org/soluble/spreadsheet/downloads.png)](https://packagist.org/packages/soluble/spreadsheet)
[![License](https://poser.pugx.org/soluble/spreadsheet/license.png)](https://packagist.org/packages/soluble/spreadsheet)

## Introduction
soluble-spreadsheet provides a generic wrapper for generating excel documents in PHP. 

**Warning: soluble-spreadsheet is currently a proof of concept and is limited to the libxl/php_excel extension wrapper. In the future it should be possible to exchange the underlying driver between PHPExcel, native LibXL, Spout or any future implementations without loosing compatibility. PR's and ideas are welcome.**

## Requirements

- PHP 5.5+ or 7.0+ 
- [libxl php extension](https://github.com/iliaal/php_excel.git)

## Documentation

 - [Manual](http://docs.soluble.io/soluble-spreadsheet/manual/) in progress and [API documentation](http://docs.soluble.io/soluble-spreadsheet/api/) available.

## Installation

Instant installation via [composer](http://getcomposer.org/).

1. Installing in your PHP project
    ```console
    $ php composer require soluble/spreadsheet:0.*
    ```
    Most modern frameworks will include Composer out of the box, but ensure the following file is included:
    ```php
    <?php
    // include the Composer autoloader
    require 'vendor/autoload.php';
    ```
2. Installing libXL / php_excel extension

    Take a look to the [install the libxl / php_excel extension document](./doc/install/install_libxl_php_excel.md).

## Examples

### Create an excel file

```php
<?php
use Soluble\Spreadsheet\Library\LibXL;

$libxl = new LibXL($valid_license);
            
$bookXLS  = $libxl->getExcelBook(LibXL::FILE_FORMAT_XLS);
$bookXLSX = $libxl->getExcelBook(LibXL::FILE_FORMAT_XLSX);

```

## Supported drivers (state)

| Name                                                   | Language      | License        | Support             |
|--------------------------------------------------------|---------------|----------------|---------------------|
| [libXL/php_excel](https://github.com/iliaal/php_excel) | C   (fast)    | Commercial     | Initial support     |
| [PHPExcel](https://github.com/PHPOffice/PHPExcel)     | PHP (slow)    | Opensource     | Not yet implemented |
| [Spout](https://github.com/box/spout)                  | PHP (medium)  | Opensource     | Not yet implemented |
| [POI](https://poi.apache.org/)                         | Java (fast)   | Opensource     | Not yet implemented |

## Contributing

Contribution are welcome see [contribution guide](./CONTRIBUTING.md)

## Coding standards

* [PSR 4 Autoloader](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-4-autoloader.md)
* [PSR 2 Coding Style Guide](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-2-coding-style-guide.md)
* [PSR 1 Coding Standards](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-1-basic-coding-standard.md)
* [PSR 0 Autoloading standards](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md)





