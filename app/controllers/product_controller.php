<?php
    /**
     * -- ProductController --
     * 
     * A controller class responsible for user interaction
     * regarding a product.
     *
     * @author Markus J. Auvo 2019
     */
    class ProductController
    {
        public static function showById($id) {
            $content = array(
                'product' => ProductModel::read($id)
            );
            View::make('product/one', $content);
        }

        public static function showByCategory($category) {
            $content = array(
                'products' => ProductModel::readByCategory($category)
            );
            View::make('product/many', $content);
        }
    }
