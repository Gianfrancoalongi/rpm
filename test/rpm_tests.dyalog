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
                                                
      corners_TEST←{
          #.UT.expect←↑(1 0 1)(0 0 0)(1 0 1)
          b←#.rpm.corners(3 3)
          #.rpm.window b
      }
      
      layers_can_be_merged_TEST←{
          #.UT.expect←↑(0 1 0)(1 1 1)(0 1 0)
          l1←#.rpm.vertical_staff(3 4)
          l2←#.rpm.horizontal_staff(4 3)
          b←#.rpm.merge l1 l2
          #.rpm.window b
      }
      
      merged_layers_are_represented_with_filled_squares_TEST←{
          #.UT.expect←↑'■ ■' '   ' '■ ■'
          b←#.rpm.corners(3 3)
          #.rpm.represent #.rpm.window b
      }
      
      layers_can_be_superimposed_TEST←{
          #.UT.expect←↑(0 1 0)(2 3 2)(0 1 0)
          l1←#.rpm.vertical_staff(3 4)
          l2←#.rpm.horizontal_staff(4 3)
          b←#.rpm.superimpose l1 l2
          #.rpm.window b
      }

:EndNameSpace
