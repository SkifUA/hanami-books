Hanami::Model.migration do
  change do
    create_table :books do
      primary_key :id
      column :title, String, null: false, size: 255
      column :author, String, null: false, size: 64
      column :summery, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
