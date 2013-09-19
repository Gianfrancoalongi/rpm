﻿:NameSpace rpm_tests

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
          b←#.rpm.square(3 3)
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
          #.UT.expect←↑'■□■' '□□□' '■□■'
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
      
      superimposed_layers_are_represented_with_grids_TEST←{
          #.UT.expect←↑'□▤□' '▥▦▥' '□▤□'
          #.rpm.represent↑(0 1 0)(2 3 2)(0 1 0)
      }
      
      move_layers_TEST←{
          #.UT.expect←↑(1 0 0)(1 0 1)(0 0 1)
          l1←#.rpm.vertical_staff(1 3)
          l2←#.rpm.vertical_staff(5 5)
          b←(¯1 0)(1 0)#.rpm.move l1 l2
          #.rpm.window #.rpm.merge b
      }
      
      merged_sequence_generated_TEST←{
          s1←↑(1 0 0)(0 0 0)(0 0 1)
          s2←↑(1 0 0)(1 0 1)(0 0 1)
          s3←↑(1 0 1)(1 0 1)(1 0 1)
          #.UT.expect←s1 s2 s3
          l1←#.rpm.vertical_staff(1 3)
          l2←#.rpm.vertical_staff(5 5)
          #.rpm.window¨(¯1 0)(1 0)#.rpm.merge_sequence l1 l2
      }
      
      superimposed_sequence_generated_TEST←{
          s1←↑(1 0 0)(0 0 0)(0 0 2)
          s2←↑(1 0 0)(1 0 2)(0 0 2)
          s3←↑(1 0 2)(1 0 2)(1 0 2)
          #.UT.expect←s1 s2 s3
          l1←#.rpm.vertical_staff(1 3)
          l2←#.rpm.vertical_staff(5 5)
          #.rpm.window¨(¯1 0)(1 0)#.rpm.superimpose_sequence l1 l2
      }
      
      start_positions_for_square_TEST←{
          #.UT.expect←1+⍳4 4
          #.rpm.start_positions'square'
      }
      
      start_position_for_vertical_staff_TEST←{
          #.UT.expect←(0 2)∘+¨⍳5 3
          #.rpm.start_positions'vertical_staff'
      }
      
      start_positon_for_horizontal_staff_TEST←{
          #.UT.expect←(2 0)∘+¨⍳3 5
          #.rpm.start_positions'horizontal_staff'
      }
      
      start_position_for_corners_TEST←{
          #.UT.expect←⍳5 5
          #.rpm.start_positions'corners'
      }
      


:EndNameSpace
