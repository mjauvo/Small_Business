<?php
    // --------------------------------------------------
    //  Routing for default controller
    // --------------------------------------------------

    $routes->get('', function() {
        IndexController::index();
    });

    $routes->get('/', function() {
        IndexController::index();
    });

    // --------------------------------------------------
    //  Routing for user controller
    // --------------------------------------------------

    $routes->get('/login', function() {
        UserController::showLogin();
    });

    $routes->get('/register', function() {
        UserController::showRegister();
    });

    // --------------------------------------------------
    //  Routing for department controller
    // --------------------------------------------------

    // Create a department: display the form

    // Create a department: process the form

    // Read all departments.
    $routes->get('/department/', function() {
        DepartmentController::showAll();
    });

    // Read all departments.
    $routes->get('/department/all', function() {
        DepartmentController::showAll();
    });

    // Read a specific department by its id.
    $routes->get('/department/:id', function($id) {
        DepartmentController::showById($id);
    });

    // Update a department: display the form

    // Update a department: process the form

    // Delete a department: display the confirmation

    // Delete a department: process the deletion

    // --------------------------------------------------
    //  Routing for product controller
    // --------------------------------------------------

    // Create a product: display the form

    // Create a product: process the form

    // Read all products from a specific product category.
    $routes->get('/product/cat/:id', function($id) {
        DepartmentController::showByCategory($id);
    });

    // Read all products from a specific product category.
    $routes->get('/product/cat/:id/all', function($id) {
        DepartmentController::showByCategory($id);
    });

    // Read a specific product by its id.
    $routes->get('/product/:id', function($id) {
        ProductController::showById($id);
    });

    // Update a product: display the form

    // Update a product: process the form

    // Delete a product: display the confirmation

    // Delete a product: process the deletion
