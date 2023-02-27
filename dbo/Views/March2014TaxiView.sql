CREATE VIEW March2014TaxiView
AS 
SELECT *
FROM
    OPENROWSET(
        BULK 'yellow/puYear=2014/puMonth=3/*.parquet',
        DATA_SOURCE = 'nyctlc_azureopendatastorage_blob_core_windows_net',
        FORMAT='PARQUET'
    ) AS nyc