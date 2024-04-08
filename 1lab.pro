predicates
nondeterm son(symbol,symbol)
nondeterm daughter(symbol,symbol)
nondeterm man(symbol)
nondeterm married(symbol,symbol)

nondeterm parent(symbol,symbol)
nondeterm mother(symbol,symbol)
nondeterm father(symbol,symbol)
nondeterm sister(symbol,symbol)
nondeterm brother(symbol,symbol)
nondeterm wife(symbol,symbol)
nondeterm husband(symbol,symbol)
nondeterm predok(symbol,symbol)

nondeterm cousin_male(symbol,symbol)
nondeterm cousin_female(symbol,symbol)
nondeterm nephew(symbol,symbol)
nondeterm niece(symbol,symbol)
nondeterm uncle(symbol,symbol)
nondeterm aunt(symbol,symbol)

nondeterm grandson(symbol,symbol)
nondeterm granddaughter(symbol,symbol)
nondeterm grandfather(symbol,symbol)
nondeterm grandmother(symbol,symbol)
nondeterm grandgrandfather(symbol,symbol)
nondeterm grandgrandmother(symbol,symbol)
nondeterm grandgrandson(symbol,symbol)
nondeterm grandgranddaugther(symbol,symbol)

nondeterm shurin(symbol,symbol)
nondeterm dever(symbol,symbol)
nondeterm zolovka(symbol,symbol)
nondeterm test(symbol,symbol)
nondeterm tesha(symbol,symbol)
nondeterm zyat(symbol,symbol)
nondeterm nevestka(symbol,symbol)
nondeterm svekr(symbol,symbol)
nondeterm sveckrov(symbol,symbol)

clauses
man(victor).
man(sergey).
man(vladimir).
man(grigory).
man(alexey).
man(danil).

son(sergey,victor).
son(sergey,irina).
son(grigory,vladimir).
son(grigory,tatiana).
son(danil,alexey).
son(danil,julia).

daughter(tatiana,sergey).
daughter(tatiana,eugenia).
daughter(alina,sergey).
daughter(alina,eugenia).
daughter(julia,victor).
daughter(julia,irina).
daughter(victoria,danil).
daughter(victoria,alisa).

married(victor,irina).
married(sergey,eugenia).
married(vladimir,tatiana).
married(alexey,julia).
married(danil,alisa).

father(Dad, Child):-man(Dad) and son(Child, Dad) or man(Dad) and daughter(Child, Dad).
mother(Mom, Child):-not(man(Mom)) and son(Child,Mom) or not(man(Mom))and daughter(Child,Mom).
sister(Sis, Person):-not(man(Sis)) and father(X, Sis) and father(X,Person) and Sis<>Person.
brother(Bro, Person):-man(Bro) and father(X, Bro) and father(X, Person)and Bro<>Person.
wife(Woman,Man):-not(man(Woman)) and married(Man, Woman).
husband(Man,Woman):-man(Man) and married(Man, Woman).

uncle(Uncle, Person):-man(Uncle) and brother(Uncle, X) and parent(X, Person).
aunt(Aunt, Person):-not(man(Aunt)) and sister(Aunt, X) and parent(X, Person).
cousin_male(Cousin, Person):-man(Cousin) and parent(X, Cousin) and uncle(X, Person).
cousin_male(Cousin, Person):-man(Cousin) and parent(X, Cousin) and aunt(X, Person).
cousin_female(Cousin, Person):-not(man(Cousin)) and parent(X, Cousin) and uncle(X, Person).
cousin_female(Cousin, Person):-not(man(Cousin)) and parent(X, Cousin) and aunt(X, Person).
nephew(Nephew, Person):-man(Nephew) and uncle(Person, Nephew) or man(Nephew) and aunt(Person, Nephew).
niece(Niece, Person):-not(man(Niece)) and uncle(Person, Niece) or not(man(Niece)) and aunt(Person, Niece).

grandfather(Grandpa, Person):-father(Grandpa, X) and parent(X, Person).
grandmother(Grandma, Person):-mother(Grandma, X) and parent(X, Person).
grandson(Grandson, Person):-son(Grandson, X) and parent(Person, X).
granddaughter(Granddaughter, Person):-daughter(Granddaughter, X) and parent(Person, X).
grandgrandfather(Grandpa, Person):-grandfather(Grandpa, X) and parent(X, Person).
grandgrandmother(Grandma, Person):-grandmother(Grandma, X) and parent (X, Person).
grandgrandson(Grandson, Person):-grandson(Grandson, X) and parent(Person, X).
grandgranddaugther(Granddaughter, Person):-granddaughter(Granddaughter, X) and parent(Person, X).

shurin(Shurin, Person):-brother(Shurin, X) and wife(X, Person).
dever(Dever, Person):-brother(Dever, X) and husband(X, Person).
zolovka(Zolovka, Person):-sister(Zolovka, X) and husband(X, Person).
test(Test, Person):-father(Test, X) and wife(X, Person).
tesha(Tesha, Person):-mother(Tesha, X) and wife(X, Person).
zyat(Zyat, Person):- husband(Zyat, X) and daughter(X, Person).
zyat(Zyat,
Person):- husband(Zyat, X) and sister(X, Person).
nevestka(Nevestka, Person):-wife(Nevestka, X) and son(X, Person) or wife(Nevestka, X) and brother(X, Person).
svekr(Svekr, Person):-father(Svekr, X) and husband(X, Person).
sveckrov(Svecrov, Person):-mother(Svecrov, X) and husband(X, Person).

predok(Name1, Name2):-parent(Name1, Name2).
predok(Name1, Name2):-parent(Name1, Name3) and predok(Name3, Name2).
parent(Name1, Name2):-father(Name1, Name2).
parent(Name1, Name2):-mother(Name1, Name2).

goal
predok(danil, Who).