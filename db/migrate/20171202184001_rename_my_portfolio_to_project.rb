class RenameMyPortfolioToProject < ActiveRecord::Migration[5.1]
  def change
    rename_table :my_portfolios, :projects
  end
end
