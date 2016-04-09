#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))
set -e

# Include configuration
TMP_DIR=/tmp
source $BASEDIR/libxl.cfg

echo "Installing phpexcel extension"

case "$1" in
    php5)
       source $BASEDIR/phpexcel_php5.cfg
       ;;
    php7)
       source $BASEDIR/phpexcel_php7.cfg 
       ;;
    php7_ondrej)
       source $BASEDIR/phpexcel_php7_ondrej.cfg 
       ;;
    *)
       echo "Error: you must provide argument 'php5' or 'php7'";
       exit 1;
       ;;
esac


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

install_libxl;
install_phpexcel_extension;
