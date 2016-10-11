︠528042fb-c7bf-4003-8c4d-4343cb6c2ed3s︠
def runRound(oldval):
    newval = []
    for i in range(order(G)):
        newval.append(oldval[i])
    for j in range(G.size()):
        e = G.edges()[j]
        if(oldval[e[0]] < oldval[e[1]]):
            newval[e[0]] = newval[e[0]] + 1
            newval[e[1]] = newval[e[1]] - 1
            flip[j][0] = flip[j][0]+1
        elif (oldval[e[0]] > oldval[e[1]]):
            newval[e[1]] = newval[e[1]] + 1
            newval[e[0]] = newval[e[0]] - 1
            flip[j][1] = flip[j][1]+1
    return newval

︡d538daa5-e022-4f70-a651-acb48bdadc19︡{"done":true}︡
︠81a5cdf3-049b-4835-975a-fe9743ec4200s︠

flip = [] # I track the orientation of the edges
v = 20
delta = 5
initvalue = []
valueHistory = []
padvalue = []


## Initialise Graph and Values
while true:
    G = graphs.RandomGNP(v, 0.1, seed=None, fast=True, algorithm='Sage')
    #G = graphs.RandomBipartite(10,8,0.5)
    if G.is_connected():
        #if G.is_bipartite():
        break
initvalue.append(1)
for i in range(G.size()):
    flip.append([0,0])
for i in range(G.order()-1):
    initvalue.append(0)
    padvalue.append(0)
print(initvalue)    
    
    # print initvalue
valueHistory.append(padvalue)
valueHistory.append(padvalue)
valueHistory.append(initvalue)
index = 3

curval = initvalue

while true:
    newval = runRound(curval)
    print newval
   # print flip
    if newval == valueHistory[index-2]:
        break
    valueHistory.append(newval)
    index = index+1
    curval = newval

#G.show()
(G.longest_path(0)).order()
index
G.eccentricity(0)
︡df8efdaf-fb37-4f2f-b658-3139f68ee258︡{"stdout":"[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]\n"}︡{"stdout":"[-1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]\n[1, 1, 0, 0, 0, 0, -1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, -4]\n[-1, -1, 0, 0, 0, 2, 1, 0, 0, -1, 1, 0, -1, 0, 0, 0, 0, 0, 0, 1]\n[1, 1, 1, 0, 0, -3, -1, 0, 1, 1, -1, 1, 1, 1, 0, 0, 1, 1, 0, -4]\n[-1, -1, 0, 1, 1, 2, 1, 1, 0, -1, 1, -3, -1, -3, 1, 1, 0, 0, 1, 1]\n[1, 1, 0, 0, 0, -3, -1, 0, 1, 1, -1, 2, 1, 1, 0, 0, 1, 1, 0, -4]\n[-1, -1, 0, 1, 1, 2, 1, 1, 0, -1, 1, -3, -1, -3, 1, 1, 0, 0, 1, 1]\n"}︡{"stdout":"13"}︡{"stdout":"\n"}︡{"stdout":"9\n"}︡{"stdout":"5\n"}︡{"done":true}︡
︠8bf04e20-a92e-4fb5-ad71-d59d28c18253s︠



G.is_hamiltonian()
︡615e8af4-dfd1-4977-9698-2cf332222509︡{"stdout":"True\n"}︡{"done":true}︡









