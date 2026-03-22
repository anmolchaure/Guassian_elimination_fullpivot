## Description

This project implements a full pivoting solver for linear systems of the form
Ax = b. It includes experiments on ill-conditioned matrices including the
Hilbert matrix and a generalised Hilbert-type matrix.

## Files

- `gaussian_elimination_fullpivot.f90` — full pivoting solver module
- `main.f90` — solves the assigned 10x10 test system
- `hilbert_mat.f90` — Hilbert matrix experiment (Task 3)
- `genhilbert_mat.f90` — generalised Hilbert matrix experiment (Task 4)
- `types.f90` — precision type definitions
- `printmat.f90` — matrix printing utility
- `linalg.f90` — linear algebra utilities
