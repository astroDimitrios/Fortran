! Write an abstract type amniote with attributes
! order, genus name, species name, diet, average lifespan,
! and a flag indicating diurnal or nocturnal.
!
! Write interfaces for deferred methods birth, breeding, 
! forage, and death. The birth and death methods should
! return logicals; the breeding method should return
! a logical and number of offspring
! (which may be zero if the animal is not breeding),
! and forage should return a logical and if true,
! what the animal ate. Extend the abstract type with
! types reptile, bird, and mammal. 
!
! Include for reptiles at least an attribute to indicate
! whether it is a turtle, a lizard or snake, or a crocodilian. 
! For birds include at least an attribute indicating whether
! it is flightless, passerine (perching birds),
! a pheasant like bird, or a waterfowl.
! For mammals indicate whether it is a monotreme (platypus, echidna),
! marsupial, or placental.
!
! Implement at least one polymorphic non deferred method feed
! which indicates for breeding animals how it feeds its young
! (self feeder should be a possibility)
! Include a constructor for each implemented type.
! The specified methods are minimums and the student should be
! creative in developing a crude model of an animal that could
! be used in a larger program such as an ecosystem model.
! Write a test unit to exercise the objects.