

import random



counterUser=0
counterComp=0
CompInput=random.randint(1, 3)
print("Computer Input",CompInput)
print('Rock =1')
print('Paper =2')
print('Scissors =3')

for i in range (3):
 
  Userinput= int(input("Will you be Rock Paper Scisoors "))
 
  
  if (Userinput==1 and CompInput==1):
    counterUser=0
    counterComp=0  

  elif(Userinput==2 and CompInput==2):
    counterUser=0
    counterComp=0

  elif(Userinput==3 and CompInput==3):
    counterUser=0
    counterComp=0
    

  elif(Userinput==1 and CompInput==2):
    counterComp =+1


  elif(Userinput==1 and CompInput==3):
    counterUser =+1


  elif(Userinput==2 and CompInput==3):
    counterComp =+1


  elif(Userinput==2 and CompInput==1):
    counterUser =+1


  elif(Userinput==3 and CompInput==2):
    counterComp =+1


  elif(Userinput==3 and CompInput==1):
    counterUser =+1




if (counterUser>counterComp):
  print("You won")
else:
  print("You lost")










	

