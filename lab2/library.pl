book(illiad, homer, study, 500).
book(c, Richie, study, 150).

book(nt_bible, sams, reference, 480).
book(logicForDum, mrLogic, reference, 378).

book(monty_python, cleese, comedy, 300).
book(comedyBook, comedyAuthor, comedy, 150).

book(theHobbit, talkin, fiction, 390).
book(harryPotter, rowling, fiction, 200).

buildLibrary(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author, Genre, Size), Lib).

holidays(book(HT, HA, _, _)) :-
    book(HT, HA, Genre, Size),
    Size < 400,
    Genre \== study,
    Genre \== reference.

revision(book(RT, RA, _, _)) :-
    book(RT, RA, Genre, Size),
    Size > 300,
    (Genre == study ; Genre == reference).

leisure(book(LT, LA, _, _)) :-
    book(LT, LA, Genre, Size),
    Size > 0,
    (Genre == comedy ; Genre == fiction).
