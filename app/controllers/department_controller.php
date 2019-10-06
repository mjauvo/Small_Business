<?php
    /**
     * -- DepartmentController --
     * 
     * A controller class responsible for user interaction
     * regarding a department.
     *
     * @author Markus J. Auvo 2019
     */
    class DepartmentController extends BaseController
    {
        public static function showById($id) {
            $content = array(
                'department' => DepartmentModel::readById($id)
            );
            View::make('department/one', $content);
        }

        public static function showAll() {
            $content = array(
                'departments' => DepartmentModel::readAll()
            );
            View::make('department/many', $content);
        }
    }
