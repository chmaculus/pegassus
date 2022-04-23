#include "common.ch"
#include "inkey.ch"
********************************
function SUBMEN

   ci1:= 4
   ci2:= 12
   ci3:= 19
   ci4:= 27
   ci5:= 36
   ci6:= 39
   do case
   case qopc = 1
      cix:= ci1
   case qopc = 2
      cix:= ci2
   case qopc = 3
      cix:= ci3
   case qopc = 4
      cix:= ci4
   case qopc = 5
      cix:= ci5
   case qopc = 6
      cix:= ci6
   endcase
   janch:= "janch" + Str(qopc, 1)
   janch:= &janch
   t_ho_on()
   jjbox(jtop + 2, cix, jtop + 3 + cuan, cix + janch + 3, "N/W*", ;
      20, 1, .T., .T., .T.)
   opcj1:= 1
   do while (opcj1 != 0)
      set message to 24 center
      i:= 1
      for i:= 1 to 10
         arra1:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(i, 1)) ;
            + ",1]"
         arra2:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(i, 1)) ;
            + ",2]"
         arra3:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(i, 1)) ;
            + ",3]"
         arra4:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(i, 1)) ;
            + ",4]"
         arra5:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(i, 1)) ;
            + ",5]"
         arra7:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(i, 1)) ;
            + ",7]"
         janch:= "janch" + Str(qopc, 1)
         janch:= &janch
         if (&arra4 < jnivop .AND. inoacc)
            @ jtop + 2 + i, cix + 1 prompt " " + Replicate(".", ;
               janch) + " "
         else
            @ jtop + 2 + i, cix + 1 prompt " " + SubStr(&arra2, 1, ;
               janch) + " " message alltrim(&arra3)
         endif
         if (i = cuan)
            exit
         endif
      next
      @ 24,  0
      set wrap on
      menu to opcj1
      do case
      case opcj1 = 1
         refsmen1()
      case opcj1 = 2
         refsmen1()
      case opcj1 = 3
         refsmen1()
      case opcj1 = 4
         refsmen1()
      case opcj1 = 5
         refsmen1()
      case opcj1 = 6
         refsmen1()
      case opcj1 = 7
         refsmen1()
      case opcj1 = 8
         refsmen1()
      case opcj1 = 9
         refsmen1()
      case opcj1 = 10
         refsmen1()
      endcase
   enddo
   SetKey(K_RIGHT, Nil)
   SetKey(K_LEFT, Nil)
   return

********************************
function T_HO_ON

   set key K_RIGHT to pupod
   set key K_LEFT to pupoi
   return

********************************
function T_HO_OFF

   SetKey(K_RIGHT, Nil)
   SetKey(K_LEFT, Nil)

********************************
function PUPOD

   keyboard Chr(27) + Chr(4) + Chr(13)
   return

********************************
function PUPOI

   keyboard Chr(27) + Chr(19) + Chr(13)
   return

********************************
function REFSMEN1

   save screen to popcj1
   oldcol:= SetColor()
   t_ho_off()
   sarra1:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(opcj1, 1)) + ;
      ",1]"
   sarra2:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(opcj1, 1)) + ;
      ",2]"
   sarra3:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(opcj1, 1)) + ;
      ",3]"
   sarra4:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(opcj1, 1)) + ;
      ",4]"
   sarra5:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(opcj1, 1)) + ;
      ",5]"
   sarra7:= "ASMENU" + Str(qopc, 1) + "[" + alltrim(Str(opcj1, 1)) + ;
      ",7]"
   if (&sarra4 >= jnivop)
      if (&sarra7)
         opcj3:= opcj1
         bas:= "ASMENU" + Str(qopc, 1)
         ejec:= &sarra5
         &ejec()
      else
         submen1()
      endif
   endif
   t_ho_on()
   set color to (oldcol)
   restore screen from popcj1
   close databases
   select 1
   set default to (idirec)
   return

********************************
function SUBMEN1

   bas:= alltrim(&sarra5)
   cuan3:= Len(&bas)
   kl:= 1
   juanch3:= 1
   do while (kl <= Len(&bas))
      if (Len(alltrim(&bas[kl][2])) > juanch3)
         juanch3:= Len(alltrim(&bas[kl][2]))
      endif
      kl:= kl + 1
   enddo
   arrib:= jtop + 3 + opcj1
   izqui:= cix + Len(alltrim(&sarra2)) - 5
   if (izqui > 50)
      izqui:= izqui - Len(alltrim(&sarra2))
   endif
   abajo:= arrib + 1 + cuan3
   derec:= izqui + 3 + juanch3
   jjbox(arrib, izqui, abajo, derec, "N/W*", 20, 1, .T., .T., .T.)
   opcj3:= 1
   do while (opcj3 != 0)
      set message to 24 center
      ik:= 1
      for ik:= 1 to cuan3
         @ arrib + ik, izqui + 1 prompt " " + SubStr(&bas[ik][2], 1, ;
            juanch3) + " " message alltrim(&bas[ik][3])
      next
      @ 24,  0
      set wrap on
      menu to opcj3
      do case
      case opcj3 = 1
         refsmen2()
      case opcj3 = 2
         refsmen2()
      case opcj3 = 3
         refsmen2()
      case opcj3 = 4
         refsmen2()
      case opcj3 = 5
         refsmen2()
      case opcj3 = 6
         refsmen2()
      case opcj3 = 7
         refsmen2()
      case opcj3 = 8
         refsmen2()
      case opcj3 = 9
         refsmen2()
      case opcj3 = 10
         refsmen2()
      endcase
   enddo
   return

********************************
function REFSMEN2

   save screen to popcj2
   oldcol:= SetColor()
   ejec3:= &bas[opcj3][4]
   &ejec3()
   set color to (oldcol)
   restore screen from popcj2
   close databases
   select 1
   set default to (idirec)
   return
