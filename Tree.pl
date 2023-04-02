married(avr,sara). % äæåâ äöãé÷é äøàùåï
married(yit,rivka).
married(yaak,lea).
parent(avr,yit).
parent(yit,yaak).
parent(yaak,reuven). % äáï äáëåø î- 12 äùáèéí
parent(yaak,shimon).
parent(yaak,levi).
parent(yaak,yehuda).
parent(yaak,dina).
parent(yehuda,zerach).
parent(yehuda,peretz).
parent(levi,kehat).
parent(levi,gershon).
parent(levi,merari).
male(avr).
male(yit).
male(yaak).
male(levi).
male(yehuda).
male(zerach).
male(peretz).
male(kehat).
male(gershon).
male(merari).
male(reuven).
male(shimon).
female(sara).
female(rivka). 
female(lea).
female(dina).


% Section 1 - äâãøú àá
father(X,Y):-parent(X,Y),male(X).

%2
mother(X,Y):- parent(X,Y),female(X).

% Section 3 - äâãøú áï
son(X,Y):-parent(Y,X),male(X).

%4
douter(X,Y):-parent(Y,X),female(X).

%5
grandfather(X,Y):-male(X),parent(X,Z),parent(Z,Y).

%6
grandmother(X,Y):-female(X),parent(X,Z),parent(Z,Y).

%7
grand_son(X,Y):-male(X), parent(Z,X), parent(Y,Z).

% Section 9 - ìöåøê äâãøú àçéí/àçéåú (sibling)
diff(X,Y):-not(X=Y).

% Section 8 - äâãøú ðëãä
grand_daugther(X,Y):-female(X), parent(Z,X), parent(Y,Z),female(Z).

%10
uncle(X,Y):- male(X),married(X,W),diff(X,W).

%11
bd(X,Y):- male(Y),parent(Z,Y),parent(W,X),diff(Z,W),female(Z).

%13
ah(X,Y):- female(Y),parent(Z,Y),diff(Z,X).

%14
bd2(X,Y):- parent(Z,X),parent(W,Y),parent(T,Z),parent(T,W),diff(W,Z).

%12
gis(X,Y):-diff(Z,Y),married(Z,X),male(Y),female(X).
gis(X,Y):-diff(Z,X),married(Y,Z),male(Y),female(X),female(Z).
gis(X,Y):-diff(Z,W),married(Z,X),married(Y,W),male(Z),female(X),female(W),male(y).
gis(X,Y):-diff(Z,Y),married(X,Z),male(Y),male(X).
gis(X,Y):-diff(Z,X),married(Y,Z),male(Y),female(Z),male(X).
gis(X,Y):-diff(Z,W),married(X,Z),married(Y,W),male(Y),male(X),female(W),female(Z).
    
    
true(t).    
malePrint(X):- ( 
    (
      male(X) , 
      write("(M)") ) 
    ); 
    (
      female(X) , 
      write("(F)")
    ) .  
printPep(X):-  
  write(X) ,
   malePrint(X) ,  
   (
    ( 
      married(X,Wife) , 
      write(" & " ) , 
      write(Wife) , 
      malePrint(Wife) 
    ) ; 
    (
       not(married(X,Wife)) , 
      write( "(Single) " ) 
    ) 
  ) .      
printNode(X,Y):-
  not( tabprint(Y)) , 
  printPep(X) , 
  write(":\n"),
  findall(A,parent(X,A),ARR),
  (recprintSons(ARR,Y); true(t)).
recprintSons(X,Y):- 
  not(X == [] ),
  G is Y+1 , 
  nth0(0,X,F) ,
  printNode(F,G) , 
  delete(X,F,XN) ,
  recprintSons(XN,Y) .      
tabprint(Y):- 
  not(Y == 0 ) , 
  G is Y-1 , 
  write("\t."), 
  tabprint(G) .    
    
     
tabprint(Y):- not(Y == 0 ) , G is Y-1 , write("\t."), tabprint(G) .
