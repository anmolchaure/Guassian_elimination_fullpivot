module linalg
    use types
    use gaussian_elimination_fullpivot
    implicit none

contains

        subroutine read_system(A, b, file_name)
            real(rkind), allocatable, intent(out) :: A(:,:), b(:)
            character(len=*), intent(in):: file_name
            integer(ikind) :: i, j, file_id, n
            n = 10

            open(newunit=file_id, file=file_name, status='old', action='read')


            allocate(A(n,n), b(n))

            do i = 1, n
                read(file_id,*) (A(i,j), j=1,n), b(i)
            end do

            close(file_id)

            print*, "mat A"
            do i = 1, n
                print *, (A(i,j), j=1,n)
            end do


        end subroutine read_system



end module linalg


!        subroutine gem_hilbert(A,b)
!             real(rkind), allocatable :: A(:,:), b(:)
!             real(rkind), allocatable :: x_exact(:)
!             integer :: i,j,n
!             n = 70
!
!
!             allocate(A(n,n))
!             allocate(b(n))
!             allocate(x_exact(n))
!
!             x_exact = 1.0_rkind
!
!             !making a hilbert matrix
!             do i=1,n
!                 do j=1,n
!                     a(i,j) = 1.0_rkind / real(i+j-1, rkind)
!                 end do
!             end do
!
!
!             b = matmul(A,x_exact)
!             print*, "vec b:", b
!
!
!             print*, "mat A"
!             do i = 1, n
!                 print *, (A(i,j), j=1,n)
!             end do
!
!             print *, "Vector b:"
!             print *, b
!
!             print*, "vector x_exact"
!             print*, x_exact
!
!
!     end subroutine











