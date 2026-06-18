class CreateReports < ActiveRecord::Migration[8.1]
  def change
    create_table :reports do |t|
      t.string :company_name
      t.string :company_domain
      t.jsonb :osint_findings, default: {}

      t.timestamps
    end

    add_index :reports, :company_domain, unique: true
    add_index :reports, :osint_findings, using: :gin
  end
end
