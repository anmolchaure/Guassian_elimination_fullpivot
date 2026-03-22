program genhilbert_mat
    use types
    use gaussian_elimination_fullpivot
    implicit none

    real(rkind), allocatable :: A(:,:), b(:), x(:), x_exact(:)
    real(rkind) :: err_inf
    integer :: i, j, n, unit_id
    real(rkind), parameter :: c = 0.83_rkind, d = 1.27_rkind
!
!     print *, "  n        error_inf"
!     print *, "----------------------"
    !saving it to plot it using R
    open(newunit=unit_id, file="genhilbert_error.dat", status="replace")


    do n = 1, 70

        allocate(A(n,n), b(n), x_exact(n))

        x_exact = 1.0_rkind

        ! build Hilbert matrix
        do i = 1, n
            do j = 1, n
                A(i,j) = 1.0_rkind / (c*real(i,rkind) + d*real(j,rkind) - real(j,rkind))
            end do
        end do

        print*, "mat A"
            do i = 1, n
                print *, (A(i,j), j=1,n)
            end do

        ! b = A * x_exact (just row sums since x_exact = all ones)
        b = matmul(A, x_exact)

        ! solve
        call gem(A, b, x)

        ! max error from exact solution
        err_inf = maxval(abs(x - 1.0_rkind))
        write(unit_id, *) n, err_inf

!         print *, n, err_inf

        deallocate(A, b, x, x_exact)

    end do
    close(unit_id)


end program genhilbert_mat
