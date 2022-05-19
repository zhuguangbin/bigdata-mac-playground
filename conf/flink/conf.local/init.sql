
-- Define available catalogs
CREATE CATALOG local_hive
  WITH (
    'type' = 'hive',
    'hive-conf-dir' = '/etc/hive/conf',
    'default-database' = 'default'
  );
--CREATE CATALOG iceberg_dlk
--  WITH (
--    'type' = 'iceberg',
--    'catalog-type' = 'hive',
--    'uri' = 'thrift://localhost:9083',
--    'hive-conf-dir' = '/etc/hive/conf'
--  );

-- Load hive module.
LOAD MODULE hive WITH ('hive-version' = '2.3.6');
USE MODULES hive, core ;
-- Define user-defined functions here.

-- CREATE FUNCTION foo.bar.AggregateUDF AS myUDF;

-- Properties that change the fundamental execution behavior of a table program.

SET 'execution.runtime-mode' = 'streaming';
SET 'sql-client.execution.result-mode' = 'tableau'; 
SET 'sql-client.execution.max-table-result.rows' = '10000'; 
SET 'sql-client.display.max-column-width' = '30';
SET 'sql-client.verbose' = 'true';

SET 'pipeline.time-characteristic' = 'EventTime';
SET 'pipeline.auto-watermark-interval' = '200'; 
SET 'parallelism.default' = '1'; 
SET 'pipeline.object-reuse' = 'true';
SET 'pipeline.max-parallelism' = '12800'; 

SET 'restart-strategy' = 'failure-rate';
SET 'restart-strategy.failure-rate.failure-rate-interval' = '5 min';
SET 'restart-strategy.failure-rate.delay' = '1 sec';
SET 'restart-strategy.failure-rate.max-failures-per-interval' = '3';


-- Configuration options for adjusting and tuning table programs.

SET 'table.exec.mini-batch.enabled' = 'true';
SET 'table.exec.mini-batch.allow-latency' = '100 ms';
SET 'table.exec.mini-batch.size' = '1000';
SET 'table.exec.state.ttl' = '1 hour'; 
SET 'table.exec.source.idle-timeout' = '1 min';
SET 'table.optimizer.join-reorder-enabled' = 'true';
SET 'table.dynamic-table-options.enabled' = 'true';
SET 'table.sql-dialect' = 'default';
SET 'table.local-time-zone' = 'default';
SET 'table.dml-sync' = 'false';
