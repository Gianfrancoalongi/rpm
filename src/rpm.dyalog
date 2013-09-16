:NameSpace rpm
    new_board ← 7 7 ⍴ 0
    window←{ ⍵[2+⍳(3 3)] }
      vertical_staff←{
          t←7 7⍴0
          t[⍳3+⊃⍵;2⊃⍵]←1
          t
      }
      horizontal_staff←{
          t←7 7⍴0
          t[⊃⍵;⍳3+2⊃⍵]←1
          t
      }
      square←{
          t←7 7⍴0
          t[⍳2+⊃⍵;⍳2+2⊃⍵]←1
          t
      }
:EndNameSpace
