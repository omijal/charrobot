Sequel.migration do
  up do
    create_table(:channels) do
      primary_key(:channel_id)
    end
  end
end
