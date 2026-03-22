module gaussian_elimination_fullpivot
    use types
    use printmat
    implicit none

contains

    subroutine gem(A, b, x)
            real(rkind), intent(in):: A(:,:), b(:)
            real(rkind), allocatable, intent(out) :: x(:)
            real(rkind), allocatable :: xtmp(:)
            real(rkind),    allocatable :: Aug(:,:), rowtmp(:), coltmp(:)
            integer(ikind), allocatable :: permut(:)
            integer(ikind)              :: n, i, j, k, itmp
            ! pivotloc(1) -> rows, pivotloc(2) -> columns
            integer(ikind)              :: pivotloc(2) ! pivot loc -> array of 2 dimension
            real(rkind)                 :: factor, rsum

            n = size(b)

            allocate(Aug(n, n+1))
            allocate(x(n))
            allocate(rowtmp(n+1))
            allocate(coltmp(n))
            allocate(permut(n))
            allocate(xtmp(n))

        ! augmented matrix
            Aug(:, 1:n) = A
            Aug(:, n+1) = b

!             x_exact = 1.0_rkind

            !call printmtx(Aug, n, n+1, "Initial Augmented Matrix [A|b]")


            ! permutation vector
            ! permut(j) = j means no columns swapped yet
            ! tracks which unknown lives in which column
            do i = 1, n
                permut(i) = i
            end do


            ! full pivoting
            do k = 1, n-1

                ! find pivot
                ! Search entire remaining submatrix Aug(k:n, k:n)
                ! for the globally largest absolute value
                ! pivotloc(1) = row index
                ! pivotloc(2) = col index
                ! +k-1 corrects slice offset back to full matrix index

                ! abs is necessary to handle negative numbers
                pivotloc = maxloc(abs(Aug(k:n, k:n))) + k - 1

                !print *, "pivot values:", Aug(pivotloc(1), pivotloc(2))

                ! column swap (BEFORE row swap)

                if (pivotloc(2) /= k) then


                    coltmp = Aug(1:n, pivotloc(2))
                    Aug(1:n, pivotloc(2)) = Aug(1:n, k)
                    Aug(1:n, k) = coltmp
                ! update the permut
                    itmp = permut(pivotloc(2))
                    permut(pivotloc(2)) = permut(k)
                    permut(k) = itmp
                end if



            ! row swap
                if (pivotloc(1) /= k) then

                    rowtmp= Aug(k, :)
                    Aug(k, :)= Aug(pivotloc(1), :)
                    Aug(pivotloc(1), :) = rowtmp
                end if

                !call printmtx(Aug, n, n+1, "After pivoting")

                do i = k+1, n
                    factor = Aug(i,k) / Aug(k,k)
                    do j = k, n+1
                        Aug(i,j) = Aug(i,j) - factor * Aug(k,j)
                    end do
                end do

                !call printmtx(Aug, n, n+1, "After elimination step")

                end do


            ! Back substitution

            x(n) = Aug(n, n+1) / Aug(n,n)

            do i = n-1, 1, -1
                rsum = 0.0_rkind
                do j = i+1, n
                    rsum = rsum + Aug(i,j) * x(j)
                end do
                x(i) = (Aug(i, n+1) - rsum) / Aug(i,i)
            end do


            ! STEP 6 — Unscramble solution
            ! print *, "Final permutation vector: ", permut
!             xtmp = x
!             x(permut) = xtmp

!             ! solution vector
!             print *, "vec x ", x
!
!             ! residual vector
!             print *, "residual"
!             do i = 1, n
!                 rsum = 0.0_rkind
!                 do j = 1, n
!                     rsum = rsum + A(i,j) * x(j)
!                 end do
!                 print *, b(i) - rsum
!             end do


    end subroutine gem

end module gaussian_elimination_fullpivot
