program save

    implicit none

    integer :: no_saving, saving

    print *, '1st no save call = ', no_saving()
    print *, '2nd no save call = ', no_saving()
    print *, '------------------------------'
    print *, '1st save call    = ', saving()
    print *, '2nd save call    = ', saving()

end program save

! Functions declare integer j then add 2 to j and return the value
! saving() function includes save with j declaration
! so j = 2 is used on the first call
! subsequent calls remember the last value of j

function no_saving()
    integer              :: no_saving
    integer              :: j ! assignment after dec
    j = 2
    j = j + 2
    no_saving = j
    return
end function no_saving

function saving()
    integer              :: saving
    !integer,            :: j = 2 implicit save
    integer, save        :: j = 2 !explicit save
    j = j + 2
    saving = j
    return
end function saving