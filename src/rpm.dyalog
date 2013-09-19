:NameSpace rpm
    new_board ← 7 7 ⍴ 0
    window←{ ⍵[2+⍳(3 3)] }
      shape←{
          t←7 7⍴0
          'vertical staff'≡⍺:{t[(¯1+⊃⍵)+⍳3;2⊃⍵]←1 ⋄ t}⍵
      }
      vertical_staff←{
          t←7 7⍴0
          t[(¯1+⊃⍵)+⍳3;2⊃⍵]←1
          t}
      horizontal_staff←{
          t←7 7⍴0
          t[⊃⍵;(¯1+2⊃⍵)+⍳3]←1
          t}
      square←{
          t←7 7⍴0
          t[(¯1+⊃⍵)+⍳2;(¯1+2⊃⍵)+⍳2]←1
          t}
      corners←{
          t←7 7⍴0
          t[{⍵(⍵+2)}⊃⍵;{⍵(⍵+2)}2⊃⍵]←1
          t}
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
      start_positions←{
          'square'≡⍵:1+⍳4 4
          'vertical_staff'≡⍵:(0 2)∘+¨⍳5 3
          'horizontal_staff'≡⍵:(2 0)∘+¨⍳3 5
          'corners'≡⍵:⍳5 5
      }
      test←{
          rules←¯2+?2⍴(⊂3 3)
          test_row←{
              l1←#.rpm.vertical_staff 2+?3 3
              l2←#.rpm.horizontal_staff 2+?3 3
              seq←⍵ merge_sequence l1 l2
              represent¨window¨seq
          }
          ⎕←test_row rules
          ⎕←'---------------'
          ⎕←test_row rules
          ⎕←'---------------'
          ⎕←test_row rules
      }
:EndNameSpace
