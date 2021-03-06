class CreateLineItemsProducts::V20180628193336 < LuckyMigrator::Migration::V1
  def migrate
    execute <<-SQL
      CREATE TABLE line_items_products (
        id uuid PRIMARY KEY,
        line_item_id uuid NOT NULL REFERENCES line_items (id),
        product_id uuid NOT NULL REFERENCES products (id),
        created_at timestamp with time zone NOT NULL,
        updated_at timestamp with time zone NOT NULL
      );
    SQL
  end

  def rollback
    drop :line_items_products
  end
end
