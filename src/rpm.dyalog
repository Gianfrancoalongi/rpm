:NameSpace rpm
    new_board ← 9 9 ⍴ 0
    window←{ ⍵[3+⍳(3 3)] }
      shape←{
          t←9 9⍴0
          'vertical staff'≡⍺:{t[(¯1+⊃⍵)+⍳3;2⊃⍵]←1 ⋄ t}⍵
          'horizontal staff'≡⍺:{t[⊃⍵;(¯1+2⊃⍵)+⍳3]←1 ⋄ t}⍵
          'square'≡⍺:{t[(¯1+⊃⍵)+⍳2;(¯1+2⊃⍵)+⍳2]←1 ⋄ t}⍵
          'corners'≡⍺:{t[{⍵(⍵+2)}⊃⍵;{⍵(⍵+2)}2⊃⍵]←1 ⋄ t}⍵
      }
      represent←{
          (∨/2 3∊⍵):'□▤▥▦'[1+⍵]
          '□■'[1+⍵]
      }
    merge←{ ⊃∨/⍵ }
    superimpose←{ ⊃+/ ⍵ × ⍳(⍴⍵) }
    move←{ ⊃¨ { (⊃⍺) ⊖ (2⊃⍺) ⌽ ⍵ }/ ¨ ↓ ⍉ ↑ ⍺ ⍵ }
      merge_sequence←{
          s1←⍵
          s2←⍺ move s1
          s3←⍺ move s2
          merge¨s1 s2 s3
      }
      superimpose_sequence←{
          s1←⍵
          s2←⍺ move s1
          s3←⍺ move s2
          superimpose¨s1 s2 s3
      }
    coordinates←{ (,⍵)/,⍳ 9 9 }
    visible←{ ⊃∨/(,3+⍳3 3)∊coordinates ⍵ }
      visible_in_next_step←{
          rule←⍵
          op←{layers←⍺∘shape¨⍵
              moved←⊃¨{(⊂rule)move(⊂⍵)}¨layers
              visibles←visible¨moved
              visibles/⍵
          }
          'square'≡⍺:⍺ op,1+⍳6 6
          'vertical staff'≡⍺:⍺ op,1+⍳5 7
          'horizontal staff'≡⍺:⍺ op,1+⍳7 5
          'corners'≡⍺:⍺ op,1+⍳5 5
      }
      random_shape←{s←'square' 'vertical staff' 'horizontal staff' 'corners'
          (?⍴s)⊃s}
      test←{
          rules←∪,1 0 ¯1∘.,1 0 ¯1
          rules←rules[(?2⍴⍴rules)]
          test_row←{
              layer_gen←{
                  rule←⍵
                  s1←random_shape ⍬
                  s1_0←s1 visible_in_next_step ⍵
                  s1_1←(visible¨{(⊂rule)move ⍵}¨s1∘shape¨s1_0)/s1_0
                  s1 #.rpm.shape(?⍴,s1_1)⊃,s1_1
              }
              l1←layer_gen(⊃rules)
              l2←layer_gen(2⊃rules)
              seq←⍵ superimpose_sequence l1 l2
              represent¨window¨seq
          }
          ⎕←test_row rules
          ⎕←'---------------'
          ⎕←test_row rules
          ⎕←'---------------'
          ⎕←(2↑test_row rules)
      }
:EndNameSpace


