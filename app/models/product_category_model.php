<?php
    /**
     * ProductCategoryModel
     * --A model class representing a product category.
     *
     * @author Markus J. Auvo 2018
     */
    class ProductCategoryModel extends BaseModel
    {
        // --------------------------------------------------
        //  A T T R I B U T E S
        // --------------------------------------------------

        public $id;
        public $name;
        public $description;

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
         * Stores a new product category in database.
         *
         * @param $product_category
         */
        public static function create($product_category) {
            $sql = "INSERT INTO TABLE tblProductCategory";
            $sql .= "VALUES (:id, :name, :description);";

            $query = DB::connection()->prepare($sql);
            $query->execute(array(
                'id'            => $this->id,
                'name'          => $this->name,
                'description'   => $this->description
            ));
            $row = $query->fetch();
        }

        /**
         * C [R] U D
         * Retrieves a product category from database.
         *
         * @param $id
         * @return \ProductCategoryModel
         */
        public static function read($id) {
            $sql  = "SELECT * ";
            $sql .= "FROM tblProductCategory ";
            $sql .= "WHERE ID = :id LIMIT 1;";

            $query = DB::connection()->prepare($sql);
            $query->execute(array('id' => $id));
            $row = $query->fetch();

            if($row) {
                $product_category = new ProductCategoryModel(array(
                    'id'            => $row['id'],
                    'name'          => $row['name'],
                    'description'   => $row['description']
                ));
            }
            return $product_category;
        }

        /**
         * C [R] U D
         * Retrieves all product categories from database.
         * 
         * @return \ProductCategoryModel
         */
        public static function readAll() {
            $sql = "SELECT * ";
            $sql .= "FROM tblProductCategory";

            $query = DB::connection()->prepare($sql);
            $query->execute();
            $rows = $query->fetchAll();

            foreach($rows as $row) {
                $product_categories[] = new ProductCategoryModel(array(
                    'id'            => $row['id'],
                    'name'          => $row['name'],
                    'description'   => $row['description']
                ));
            }
            return $product_categories;
        }

	/**
	 * C R [U] D
	 * Updates a product_category in database.
	 * 
	 * @param type $id
	 */
        public static function update() {
            $sql  = "UPDATE tblProductCategory ";
            $sql .= "SET name=:name, description=:description ";
            $sql .= "WHERE id=:id RETURNING id;";

            $query = DB::connection()->prepare($sql);
            $query->execute(array(
                'id'            => $this->id,
                'name'          => $this->name,
                'description'   => $this->description
            ));
            $row = $query->fetch();
        }

        /**
         * C R U [D]
         * Deletes a product_category from database.
         * 
         * @param type $id
         */
        public static function delete($id) {
            $sql  = "DELETE FROM tblProductCategory ";
            $sql .= "WHERE id= :id;";

            $query = DB::connection()->prepare($sql);
            $query->execute(array(
                'id' => $this->id
            ));
            $row = $query->fetch();
        }
    } // End of class
