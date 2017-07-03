class AddCompetitionColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :competitions, :type, :string
    add_column :competitions, :finals, :boolean, default: false
    add_column :competitions, :placement, :integer

  end
end
