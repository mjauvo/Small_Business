<?php
    /**
     * Description of ProductCategoryController
     *
     * @author mjauv
     */
    class ProductCategoryController extends BaseController
    {
        public static function showAll() {
            $content = array(
                'product_categories' => ProductCategoryModel::readAll()
            );
            View::make('productcategory/all', $content);
        }

        public static function show($id) {
            $content = array(
                'department' => ProductCategoryModel::read($id)
            );
            View::make('productcategory/one', $content);
        }
    }
