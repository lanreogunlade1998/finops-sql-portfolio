-- =============================================================================
-- DataCloudCo FinOps SQL Portfolio
-- File: 00_setup-duckdb.sql
-- Purpose: Create all tables from the provided CSV files using DuckDB
-- Instructions: Run this file once at the beginning
-- =============================================================================

-- Optional: use :memory: or a file-based database
-- DuckDB will create 'finops.duckdb' file in current directory if you use ATTACH

ATTACH 'finops.duckdb' AS finops (READ_ONLY FALSE);

-- Create tables (adjust paths if your CSVs are in a subfolder 'data/')
CREATE OR REPLACE TABLE aws_cost AS
SELECT * FROM read_csv_auto('aws_cost_usage_report.csv');

CREATE OR REPLACE TABLE azure_cost AS
SELECT * FROM read_csv_auto('azure_cost_export.csv');

CREATE OR REPLACE TABLE azure_rg_budgets AS
SELECT * FROM read_csv_auto('azure_rg_budgets.csv');

CREATE OR REPLACE TABLE budget_reference AS
SELECT * FROM read_csv_auto('budget_reference.csv');

CREATE OR REPLACE TABLE business_events AS
SELECT * FROM read_csv_auto('business_events.csv');

CREATE OR REPLACE TABLE business_unit_mapping AS
SELECT * FROM read_csv_auto('business_unit_mapping.csv');

CREATE OR REPLACE TABLE cloudwatch_metrics AS
SELECT * FROM read_csv_auto('cloudwatch_metrics.csv');

CREATE OR REPLACE TABLE ec2_inventory AS
SELECT * FROM read_csv_auto('ec2_inventory.csv');

CREATE OR REPLACE TABLE gcp_billing_export AS
SELECT * FROM read_csv_auto('gcp_billing_export.csv');

CREATE OR REPLACE TABLE k8s_cost_allocation AS
SELECT * FROM read_csv_auto('k8s_cost_allocation.csv');

CREATE OR REPLACE TABLE resource_daily_cost AS
SELECT * FROM read_csv_auto('resource_daily_cost.csv');

CREATE OR REPLACE TABLE ri_inventory AS
SELECT * FROM read_csv_auto('ri_inventory.csv');

CREATE OR REPLACE TABLE storage_object_inventory AS
SELECT * FROM read_csv_auto('storage_object_inventory.csv');

-- Quick smoke test
SELECT 'AWS rows' AS table_name, count(*) AS row_count FROM aws_cost
UNION ALL
SELECT 'Azure rows', count(*) FROM azure_cost
UNION ALL
SELECT 'EC2 inventory rows', count(*) FROM ec2_inventory;
