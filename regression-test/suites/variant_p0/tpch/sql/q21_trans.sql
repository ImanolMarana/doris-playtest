-- ERROR: No value present
-- SELECT
--   CAST(S.var["S_NAME"] AS TEXT),
--   COUNT(*) AS NUMWAIT
-- FROM
--   supplier S,
--   lineitem L1,
--   orders O,
--   nation N
-- WHERE
--   CAST(S.var["S_SUPPKEY"] AS INT) = CAST(L1.var["L_SUPPKEY"] AS INT)
--   AND CAST(O.var["O_ORDERKEY"] AS INT) = CAST(L1.var["L_ORDERKEY"] AS INT)
--   AND CAST(O.var["O_ORDERSTATUS"] as text)= 'F'
--   AND CAST(L1.var["L_RECEIPTDATE"] AS DATE) > CAST(L1.var["L_COMMITDATE"] AS DATE)
--   AND EXISTS(
--     SELECT *
--     FROM
--       lineitem L2
--     WHERE
--       CAST(L2.var["L_ORDERKEY"] AS INT) = CAST(L1.var["L_ORDERKEY"] AS INT)
--       AND CAST(L2.var["L_SUPPKEY"] AS INT) <> CAST(L1.var["L_SUPPKEY"] AS INT)
--   )
--   AND NOT EXISTS(
--     SELECT *
--     FROM
--       lineitem L3
--     WHERE
--       CAST(L3.var["L_ORDERKEY"] AS INT) = CAST(L1.var["L_ORDERKEY"] AS INT)
--       AND CAST(L3.var["L_SUPPKEY"] AS INT) <> CAST(L1.var["L_SUPPKEY"] AS INT)
--       AND CAST(L3.var["L_RECEIPTDATE"] AS DATE) > CAST(L3.var["L_COMMITDATE"] AS DATE)
--   )
--   AND CAST(S.var["S_NATIONKEY"] AS INT) = CAST(N.var["N_NATIONKEY"] AS INT)
--   AND CAST(N.var["N_NAME"] AS TEXT) = 'SAUDI ARABIA'
-- GROUP BY
--   CAST(S.var["S_NAME"] AS TEXT)
-- ORDER BY
--   NUMWAIT DESC,
--   CAST(S.var["S_NAME"] AS TEXT)
-- LIMIT 100