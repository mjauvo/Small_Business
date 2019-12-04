<?php
    /**
     * -- UserController --
     * 
     * A controller class responsible for user interaction
     * regarding a user.
     *
     * @author Markus J. Auvo 2019
     */
    class UserController extends BaseController
    {
        public static function showLogin() {
            View::make('login');
        }

        public static function showRegister() {
            View::make('register');
        }
    }
