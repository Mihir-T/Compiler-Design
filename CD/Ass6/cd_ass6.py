import string
f = open("input-6.txt", "r")
num_lines = sum(1 for line in open('input-6.txt'))

def countX(lst, x):
    count = 0
    for ele in lst:
        if (ele == x):
            count = count + 1
    return count

#print(num_lines)
operands = []
operators =[]
result =[]
mylist = []
temp = []
for x in f:   
    temp = list(x.split())
    operators.append(temp[0])
    operands.extend((temp[1],temp[2]))
    result.append(temp[3])
    #print(temp)
    mylist.append(temp)
    
print("\nINPUT QUADRUPLE\n")
for i in mylist:
    print("\n",i)

b = 0
temp = []
for a in range(0,num_lines-1):
    if mylist[a][0] == mylist[a+1][0] and mylist[a][1] == mylist[a+1][1] and mylist[a][2] == mylist[a+1][2] :
        if  mylist[a][1] and mylist[a+1][1] not in result:
            temp.extend(('=', mylist[a][b+3],"  ",mylist[a+1][b+3]))
            del(mylist[a+1])
            mylist.insert(a+1,temp)
    if mylist[a][0] == '=' and mylist[a][2] and mylist[a+1][2] == '?' and mylist[a+1][1] in result and countX(result,mylist[a][3]) == 1:
        mylist[a+1][1]= mylist[a][1]
        result.remove(mylist[a][3])
print("\nOPTIMIZED QUADRUPLE AFTER COMMON SUBEXPR ELIMINATION AND CONSTANT FOLDING\n")
for i in mylist:
    print("\n",i)