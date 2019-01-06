<?php
    /**
     * Description of DepartmentController
     *
     * @author mjauv
     */
    class DepartmentController extends BaseController {
        public static function showAll() {
            $content = array(
                'departments' => DepartmentModel::readAll()
            );
            View::make('department_list', $content);
        }
    }
