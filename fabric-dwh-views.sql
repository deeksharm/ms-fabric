CREATE VIEW dbo.sales_wh_vw
AS
select * from<[warehouse]>.<[schema]>.<{table}>

---------------------

CREATE VIEW dbo.sales_lh_vw
AS
select * from<[lakehouse]>.<[schema]>.<{table}>
