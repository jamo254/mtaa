class AddSummaryToCommunities < ActiveRecord::Migration[7.1]
  def change
    add_column :communities, :summary, :string
  end
end
