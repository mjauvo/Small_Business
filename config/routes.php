<?php

    // --------------------------------------------------
    //  Routing for default controller
    // --------------------------------------------------

    $routes->get('/', function() {
        IndexController::index();
    });

    // --------------------------------------------------
    //  Routing for department controller
    // --------------------------------------------------

    $routes->get('/department/', function() {
        DepartmentController::showAll();
    });

    $routes->get('/department/all', function() {
        DepartmentController::showAll();
    });

    $routes->get('/department/:id', function($id) {
        DepartmentController::show($id);
    });
