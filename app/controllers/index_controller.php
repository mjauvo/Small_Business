<?php

    class IndexController extends BaseController
    {
        // Display the start page
        public static function index(){
            View::make('index');
        }
    }
