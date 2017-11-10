Hanami::Model.migration do
  change do
    alter_table :books do
      rename_column :summery, :summary
    end
  end
end
