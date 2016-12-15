-------------------------------- MODULE GCD --------------------------------
EXTENDS Integers
Divides(p, n) == \E q \in 1..n : n = q * p
DivisorsOf(n) == {p \in 1..n : Divides(p, n)}
SetMax(S) == CHOOSE i \in S : \A j \in S : i >= j

GCD(m, n) == SetMax(DivisorsOf(m) \cap DivisorsOf(n))

=============================================================================
\* Modification History
\* Last modified Tue Dec 06 16:39:57 CST 2016 by johir
\* Created Tue Dec 06 14:38:52 CST 2016 by johir
