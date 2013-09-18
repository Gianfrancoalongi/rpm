:NameSpace rpm
    new_board ← 7 7 ⍴ 0
    window←{ ⍵[2+⍳(3 3)] }
      vertical_staff←{
          t←7 7⍴0
          t[(¯1+⊃⍵)+⍳3;2⊃⍵]←1
          t
      }
      horizontal_staff←{
          t←7 7⍴0
          t[⊃⍵;(¯1+2⊃⍵)+⍳3]←1
          t
      }
      square←{
          t←7 7⍴0
          t[(¯1+⊃⍵)+⍳2;(¯1+2⊃⍵)+⍳2]←1
          t
      }
      corners←{
          t←7 7⍴0
          t[{⍵(⍵+2)}⊃⍵;{⍵(⍵+2)}2⊃⍵]←1
          t
      }
    merge←{ ⊃∨/⍵ }
      represent←{
          (∨/2 3∊⍵):' ▤▥▦'[1+⍵]
          ' ■'[1+⍵]
      }
    superimpose←{ ⊃+/ ⍵ × ⍳(⍴⍵) }
    move←{ ⊃¨ { (⊃⍺) ⊖ (2⊃⍺) ⌽ ⍵ }/ ¨ ↓ ⍉ ↑ ⍺ ⍵ }    
      sequence←{
          s1←⍵
          s2←⍺ move s1
          s3←⍺ move s2
          merge¨s1 s2 s3
      }
:EndNameSpace
