:NameSpace rpm_tests

      window_sees_3_by_3_TEST←{
          #.UT.expect←↑(0 0 0)(0 0 0)(0 0 0)
          b←#.rpm.new_board
          #.rpm.window b
      }
      
      vertical_staff_TEST←{
          #.UT.expect←↑(1 0 0)(1 0 0)(1 0 0)
          b←#.rpm.vertical_staff(3 3)
          #.rpm.window b
      }
      
      horizontal_staff_TEST←{
          #.UT.expect←↑(1 1 1)(0 0 0)(0 0 0)
          b←#.rpm.horizontal_staff(3 3)
          #.rpm.window b
      }
      
      square_TEST←{
          #.UT.expect←↑(1 1 0)(1 1 0)(0 0 0)
          b←#.rpm.square(2 2)
          #.rpm.window b
      }
     

:EndNameSpace
