# php_excel extension install

The most up to date documentation should be available on the official iliaal/php_excel(https://github.com/iliaal/php_excel) github repo. 

Alternatively, if you are using linux, you can refer to following 3 steps (updated in April 2016).

1. **Install the LibXL library**

    Prior to install the php_excel extension, you must download and install the [LibXL](http://www.libxl.com/) library (commercial).
    
    As an example, the following script should work on any linux 64bits distribution and install the libxl into the `$LIBXL_INSTALL_DIR` directory :
    
    ```bash
    #!/bin/bash
    LIBXL_VERSION=3.6.5
    LIBXL_ARCHIVE_EXT=$LIBXL_VERSION.0
    LIBXL_INSTALL_DIR=~/libxl
    TMP_DIR=/tmp

    set -e    

    install_libxl() {
        echo "Downloading and extracting libxl $LIBXL_VERSION for linux..."
        cd $TMP_DIR
        wget -q -O libxl-lin-$LIBXL_VERSION.tar.gz http://www.libxl.com/download/libxl-lin-$LIBXL_VERSION.tar.gz
        tar -xf libxl-lin-$LIBXL_VERSION.tar.gz
        cd libxl-$LIBXL_ARCHIVE_EXT/
        echo "Installing lbxl in $LIBXL_INSTALL_DIR..."
        mkdir -p $LIBXL_INSTALL_DIR/lib
        mkdir -p $LIBXL_INSTALL_DIR/usr/include
        cp lib64/libxl.so $LIBXL_INSTALL_DIR/lib/libxl.so
        cp -r include_c/ $LIBXL_INSTALL_DIR/include_c
    }
    
    install_libxl;
    ```

2. **Install the php_excel extension**

    For **PHP5** refer to the official iliaal/php_excel(https://github.com/iliaal/php_excel) github repo or use the bash script below. 

    For **PHP7** a working PR is available on [johmue/php_excel](https://github.com/johmue/php_excel/tree/php7), just replace 
    the `$PHP_EXCEL_URL` by "https://github.com/johmue/php_excel/archive/php7.zip" and `$PHP_EXCEL_ARCHIVE_DIR` by "php7".
    
    ```bash
    #!/bin/bash


    TMP_DIR=/tmp
    LIBXL_INSTALL_DIR=~/libxl
    PHP_CONFIG=`which php-config`
    PHPIZE=`which phpize`
    PHP_EXCEL_URL=https://github.com/iliaal/php_excel/archive/master.zip
    PHP_EXCEL_ARCHIVE_DIR=php_excel-master

    set -e

    install_phpexcel_extension() {
        echo "Downloading and compling PHP_EXCEL extension for libxl"
        wget -q -O $TMP_DIR/php_excel.zip $PHP_EXCEL_URL
        unzip -o $TMP_DIR/php_excel.zip -d $TMP_DIR
        cd $TMP_DIR/$PHP_EXCEL_ARCHIVE_DIR/
        eval "$PHPIZE"
        ./configure --with-php-config=$PHP_CONFIG --with-libxl-incdir=$LIBXL_INSTALL_DIR/include_c/ --with-libxl-libdir=$LIBXL_INSTALL_DIR/lib/ --with-excel=$LIBXL_INSTALL_DIR
        make
        #make test
        echo "Installing php extension (need sudo)"
        sudo make install
        echo "Install succeed, please add extension=excel.so in your php.ini"
    }

    install_phpexcel_extension;
    ```

    Also note if you are using ondrej/ppa for php7 on Ubuntu/Debian that you may have to replace php-config by php-config7.0 and phpize by phpize-7.0.

3. **Enable the php_excel extension**

   In order to enable the php_excel extension just add "extension=excel.so" to your php.ini.