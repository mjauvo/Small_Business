<?php
    /**
     * Description of DepartmentController
     *
     * @author mjauv
     */
    class DepartmentController extends BaseController {
        public static function showAll() {
            View::make('department_list.html');
        }
    }
