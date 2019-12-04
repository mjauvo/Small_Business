<?php
    /**
     * -- SaleOrderModel --
     * 
     * A model class representing a sale order
     * and responsible for Sale Order data.
     * 
     * 10 -- New
     * 20 -- As Work Order
     * 40 -- Ready for Delivery
     * 60 -- Shipped
     * 90 -- Delivered
     *
     * @author Markus J. Auvo 2019
     */
    class SaleOrderModel extends BaseModel
    {
        // --------------------------------------------------
        //  A T T R I B U T E S
        // --------------------------------------------------

        public $id;
        public $customer_id;
        public $status;

        // --------------------------------------------------
        //  C O N S T R U C T O R
        // --------------------------------------------------

        public function __construct($attributes = null) {
            parent::__construct($attributes);
        }

        // --------------------------------------------------
        //  S T A T I C   D A T A B A S E   M E T H O D S
        // --------------------------------------------------

        /**
         * [C] R U D
         * Stores a new sale order in database.
         *
         * @param $sale_order
         */
        public static function create($sale_order) {
            $sql = "INSERT INTO tblDepartment";
            $sql .= "VALUES (:id, :customer_id, :status);";

            $query = DB::connection()->prepare($sql);
            $query->execute(array(
                'ID' => $this->id,
                'customerID' => $this->customer_id,
                'status' => $this->status
            ));
        }

        /**
         * C [R] U D
         * Retrieves a sale order from database
         * based on its database identifier.
         *
         * @param $id
         * @return \SaleOrderModel
         */
        public static function readById($id) {
        }

        /**
         * C [R] U D
         * Retrieves sale order(s) from database
         * based on customer identifier.
         *
         * @param $id
         * @return \SaleOrderModel
         */
        public static function readByCustomerId($id) {
        }

        public static function readAll() {
            
        }
    }
