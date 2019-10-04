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
<<<<<<< HEAD
        public static function showAll() {
=======
        public static function showById($id) {
>>>>>>> 3d54ed97f6db3888273cb8f9b225e092da182a8d
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
