program test_gem
    use linalg
    implicit none

    real(rkind), allocatable :: A(:,:), b(:), x(:)



    call read_system(A, b, "assigned_matrix.txt")
!   call gem_hilbert(A,b)
    ! full pivot
    call gem(A, b, x)

end program test_gem
