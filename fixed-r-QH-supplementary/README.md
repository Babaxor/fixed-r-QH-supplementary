Computational Verification: Fixed-5k QH Semigroups

This repository contains the GAP scripts and output logs used to verify the results in Section 6 of the manuscript "[Insert Paper Title Here]".
System Specifications & Environment

To ensure reproducibility, the computations were performed in the following environment:

    GAP Version: 4.14.0
    Semigroups Package Version: 5.5.4
    Operating System: Windows 10
    Date of Execution: 2026/01/07 

Semigroup Definitions

The scripts verify the family Sk​ defined by the presentation:Sk​=⟨a,b∣a5k=a, aba=b, ab=b3a⟩.The parameter r is verified to be r=5k.
How to Run

    Open GAP.
    Load the Semigroups package: LoadPackage("semigroups");
    Read the main script: Read("src/verify_family_Sk.gap");

Data Files

    results/verification_log_S1.txt: Verification log for semigroup S1​ (Order 12, r=5).
    results/verification_log_S2.txt: Verification log for semigroup S2​ (Order 32, r=25).