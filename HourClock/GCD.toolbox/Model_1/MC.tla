---- MODULE MC ----
EXTENDS GCD, TLC

\* Constant expression definition @modelExpressionEval
const_expr_1481066174056202000 == 
GCD(4,8)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1481066174056202000>>)
----

=============================================================================
\* Modification History
\* Created Tue Dec 06 17:16:14 CST 2016 by johir
