<?php
    /**
     * -- ProductModel --
     * 
     * A model class representing a product sold by
     * Small Business and responsible for Product
     * data.
     *
     * @author Markus J. Auvo 2019
     */
    class ProductModel extends BaseModel
    {
        // --------------------------------------------------
        //  A T T R I B U T E S
        // --------------------------------------------------

        public $id;
        public $name;
        public $description;
        public $category;
        public $supplier;
        public $unit_price;
        public $reorder_point;
        public $inventory;

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
         * Stores a new product in database.
         */
        public static function create() {
            $sql  = "INSERT INTO tblProduct";
            $sql .= "VALUES (:id, :name, :description, ";
            $sql .= ":category, :supplier, :unit_price, :reorder_point, ";
            $sql .= ":inventory);";

            $query = DB::connection()->prepare($sql);
            $query->execute(array(
                'id' => $this->id,
                'name' => $this->name,
                'description' => $this->description,
                'category' => $this->category,
                'supplier' => $this->supplier,
                'unit_price' => $this->unit_price,
                'reorder_point' => $this->reorder_point,
                'inventory' => $this->inventory
            ));
            $row = $query->fetch();
            $this->id = $row['id'];
        }

        /**
         * C [R] U D
         * Retrieves a product from database
         * based on its database identifier.
         *
         * @param $id
         * @return \ProductModel
         */
        public static function readById($id) {
            $sql  = "SELECT * ";
            $sql .= "FROM tblProduct ";
            $sql .= "WHERE ID = :id LIMIT 1;";

            $query = DB::connection()->prepare($sql);
            $query->execute(array('id' => $id));
            $row = $query->fetch();

            if($row) {
                $product = new ProductModel(array(
                    'id'            => $row['id'],
                    'name'          => $row['productname'],
                    'description'   => $row['description'],
                    'category'      => $row['category'],
                    'supplier'      => $row['supplier'],
                    'unit_price'    => $row['unit_price'],
                    'reorder_point' => $row['reorder_point'],
                    'inventory'     => $row['inventory']
                ));
            }

            return $product;
        }

        /**
         * C [R] U D
         * Retrieves products from database
         * based on their product category.
         *
         * @param $category
         * @return \ProductModel
         */
        public static function readByCategory($category) { 
            $sql  = "SELECT * ";
            $sql .= "FROM tblProduct ";
            $sql .= "WHERE categoryID = :category;";

            $query = DB::connection()->prepare($sql);
            $query->execute();
            $rows = $query->fetchAll();

            foreach($rows as $row) {
                $products[] = new ProductModel(array(
                    'id'            => $row['id'],
                    'name'          => $row['productname'],
                    'description'   => $row['description'],
                    'category'      => $row['category'],
                    'supplier'      => $row['supplier'],
                    'unit_price'    => $row['unit_price'],
                    'reorder_point' => $row['reorder_point'],
                    'inventory'     => $row['inventory']
                ));
            }

            return $products;
        }
    }
