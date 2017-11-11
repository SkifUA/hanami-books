Hanami::Model.migration do
  change do
    create_table :genres do
      primary_key :id
      column :name, String, null: false, size: 64

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
