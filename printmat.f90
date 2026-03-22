module printmat
    use types
    implicit none

contains

    subroutine printmtx(M, rows, cols, name)
        real(rkind),     intent(in) :: M(:,:)
        integer(ikind),  intent(in) :: rows, cols
        character(len=*),intent(in) :: name

        integer(ikind) :: i, j
!
!         print *, " "
!         print *, "---- ", trim(name), " ----"
!         do i = 1, rows
!             print *, (M(i,j), j=1,cols)
!         end do
!         print *, "--------------------------"
!         print *, " "

    end subroutine printmtx

end module printmat
