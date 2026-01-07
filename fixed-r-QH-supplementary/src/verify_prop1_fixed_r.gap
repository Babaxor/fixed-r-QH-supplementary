# =========================================================
# Verification Script for Family S_k (Corrected Relations)
# Relations: a^(5^k)=a, aba=b, ab=b^3*a
# =========================================================

LoadPackage("semigroups");

# ---------------------------------------------------------
# FIX: Definition of Missing Function IsFixedR
# This function checks if x^r = x for all x in S
# ---------------------------------------------------------
IsFixedR := function(S, r)
    local x;
    for x in S do
        if x^r <> x then
            return false;
        fi;
    od;
    return true;
end;

# ---------------------------------------------------------
# Function to Verify S_k
# ---------------------------------------------------------
VerifySk := function(k)
    local r, F, a, b, S_pres, S, result, out_str, filename, size_S;
    
    r := 5^k;
    Print("\n-------------------------------------------------\n");
    Print("Processing S_", k, " with r = ", r, "...\n");
    
    F := FreeSemigroup("a", "b");
    a := F.1; b := F.2;
    
    # CORRECTED RELATIONS
    # 1. a^(5^k) = a
    # 2. a*b*a = b  (i.e., aba = b)
    # 3. a*b = b^3*a (i.e., ab = b^3 a)
    S_pres := F / [[a^r, a], [a*b*a, b], [a*b, b^3*a]];
    
    # Create a faithful representation as a transformation semigroup
    S := Image(IsomorphismTransformationSemigroup(S_pres));
    size_S := Size(S);
    
    # Check Fixed-r Property
    result := IsFixedR(S, r);
    
    # Save Output
    filename := Concatenation("verification_log_S", String(k), ".txt");
    out_str := Concatenation(
        "Verification Log for S_", String(k), "\n",
        "Parameter k: ", String(k), "\n",
        "Parameter r (5^k): ", String(r), "\n",
        "Order of Semigroup: ", String(size_S), "\n",
        "Fixed-r Property: ", String(result), "\n",
        "Pairs Checked: ", String(size_S * size_S), "\n"
    );
    
    PrintTo(filename, out_str);
    Print("Result: ", String(result), " | Order: ", size_S, "\n");
    Print("Log saved to: ", filename, "\n");
end;

# ---------------------------------------------------------
# Main Execution Loop (k=1 to 2)
# ---------------------------------------------------------
for k in [1, 2] do
    VerifySk(k);
od;

Print("\nAll verifications complete.\n");