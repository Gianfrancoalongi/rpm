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
          (∨/2 3∊⍵):'□ ▤▥ ▦'[1+⍵]
          '□■'[1+⍵]
      }
    merge←{ ⊃∨/⍵ }
    superimpose←{ ⊃+/2 3 × ⍵}
    move←{ ⊃¨ { (⊃⍺) ⊖ (2⊃⍺) ⌽ ⍵ }/ ¨ ↓ ⍉ ↑ ⍺ ⍵ }
      sequence←{
          s1←⍵
          s2←⍺ move s1
          s3←⍺ move s2
          s1 s2 s3
      }
    merge_sequence←{ merge ¨ ⍺ sequence ⍵}
    superimpose_sequence←{ superimpose ¨ ⍺ sequence ⍵ }
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
:EndNameSpace


