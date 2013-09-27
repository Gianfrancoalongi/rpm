:NameSpace rpm_client

      random_shape←{
          s←'square' 'vertical staff' 'horizontal staff' 'corners'
          (?⍴s)⊃s
      }

      test←{
          rules←∪,1 0 ¯1∘.,1 0 ¯1
          rules←rules[(?2⍴⍴rules)]
          test_row←{
              layer_gen←{
                  rule←⍵
                  s1←random_shape ⍬
                  s1_0←s1 #.rpm.visible_in_next_step ⍵
                  s1_1←(#.rpm.visible¨{(⊂rule)#.rpm.move ⍵}¨s1∘#.rpm.shape¨s1_0)/s1_0
                  s1 #.rpm.shape(?⍴,s1_1)⊃,s1_1
              }
              l1←layer_gen(⊃rules)
              l2←layer_gen(2⊃rules)
              seq←⍵ #.rpm.superimpose_sequence l1 l2
              #.rpm.represent¨#.rpm.window¨seq
          }
          ⎕←test_row rules
          ⎕←'---------------'
          ⎕←test_row rules
          ⎕←'---------------'
          last_row←test_row rules
          ⎕←(2↑last_row)
          fake_rules←(∪,1 0 ¯1∘.,1 0 ¯1)~rules
          fakes←{(⊂⍵)#.rpm.move(⊂2⊃last_row)}¨fake_rules
          all_options←fakes,⊂(3⊃last_row)
          ⎕←all_options[(⍴all_options)?⍴all_options]
      }



:EndNameSpace