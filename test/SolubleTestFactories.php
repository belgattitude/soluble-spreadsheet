<?php

class SolubleTestFactories {

    /**
     * @return string
     */
    public static function getCachePath() {
        $cache_dir = $_SERVER['PHPUNIT_CACHE_DIR'];
        if (!preg_match('/^\//', $cache_dir)) {
            $cache_dir = dirname(__FILE__) . DIRECTORY_SEPARATOR . $cache_dir;
        }
        return $cache_dir;
    }

    /**
     *
     * @return array
     */
    public static function getLibXLLicense() {
        return array(
            'name' => $_SERVER['LIBXL_LICENSE_NAME'],
            'key' => $_SERVER['LIBXL_LICENSE_KEY']
        );
    }

}
