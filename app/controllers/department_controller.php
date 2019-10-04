<?php
    /**
     * Description of DepartmentController
     *
     * @author mjauv
     */
    class DepartmentController extends BaseController
    {
        public static function showAll() {
            $content = array(
                'departments' => DepartmentModel::readAll()
            );
            View::make('department/all', $content);
        }

        public static function show($id) {
            $content = array(
                'department' => DepartmentModel::read($id)
            );
            View::make('department/one', $content);
        }
    }
