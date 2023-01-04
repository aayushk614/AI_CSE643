% starting
start:-

     reconsult('D:/Prolog/A1-AI-Aayush Kumar-MT22001/temp1.pl'),
     consult('C:/Users/KIIT/result.pl'),nl,
    advise.

%starting welcome note
advise:-

    %read(Name),nl,
   % name(Name),

    special(Specialization_choice),
    %read(Specialization_choice),
    specialization(Specialization_choice).


% to clear all temporary data from temp.pl data file
clear:-

     retractall(interest_in_subject(_,_)),
     retractall(project(_,_)),
     retractall(course(_,_)),
     tell('D:/Prolog/A1-AI-Aayush Kumar-MT22001/temp1.pl'),
    told.



clear_r :-

    tell('D:/Prolog/A1-AI-Aayush Kumar-MT22001/temp2.pl'),
    write("\'"),
    write("List of electives"),
    write("\'."),nl,nl,
    told.

% to save the results in temp2.pl temporarily
save_result(Sub):-

    append('D:/Prolog/A1-AI-Aayush Kumar-MT22001/temp2.pl'),
    write("\'"),
    write(Sub),
    write("\'."),nl,
    told().

output:-

    see('D:/Prolog/A1-AI-Aayush Kumar-MT22001/temp2.pl'),
    process_file,
    seen.

process_file :-
   read(Line),
   Line \== end_of_file,
   process(Line).
process_file :- !.

process(Line):-
   write(Line),nl,
   process_file.


% Prompts for the level of interest in particular domain
prompt_interest_levels_ai(Interest, Title):-
    /*write("Level of interest in "),
    write(Title),
    write(" "),
    read(Interest_Level),*/
    ((Interest == 'ML') ->
          sub1(InterestLevel)
    ;
    (Interest == 'AI') ->
          sub2(InterestLevel)
    ;
    (Interest == 'GA') ->
          sub3(InterestLevel)
    ;
    (Interest == 'DMG') ->
          sub4(InterestLevel)
    ;
    (Interest == 'NLP') ->
          sub5(InterestLevel)
    ;
    (Interest == 'DL') ->
          sub6(InterestLevel)
    ;


    write("")

    ),
    interest_in_subject('DSA' , Knowledge1),
    interest_in_subject('LA' , Knowledge2),
    interest_in_subject('CA' , Knowledge3),
    interest_in_subject('PS' , Knowledge4),
    project('MLP' , Proj ),
    course('MLC' , Cou ),


  (( Interest == 'ML' , Knowledge1 >=  2 , Knowledge2 >= 3 , Knowledge3 >= 3 , Knowledge4 >= 2 ) ->
        Sub1 = 'ML',
        save_result(Sub1)
   ;

   ( Interest  == 'DL'  , Proj == 'Y' ) ->

         Sub1 = 'DL',
         save_result(Sub1)

  ;
  ( Interest  == 'DMG' , Knowledge1 >= 2  , Knowledge2 >= 2  , Knowledge4 >= 2  ) ->
    Sub1 = 'DMG',
    save_result(Sub1)
   ;
  ( Interest  == 'GA' , Knowledge1 >= 3   ) ->
    Sub1 = 'GA',
    save_result(Sub1)
   ;

  ( Interest  == 'AI' , Knowledge1 >= 3  ) ->
    Sub1 = 'AI',
    save_result(Sub1)
   ;
  ( Interest  == 'NLP'  , Knowledge1 >=  2 , Knowledge2 >= 2 , Knowledge3 >=2 , Knowledge4 >= 2 , Cou == 'Y'   ) ->
    Sub1 = 'NLP',
    save_result(Sub1)
   ;


      write("")

   ),



    assertz(interest_in_subject(Interest  , Interest_Level)).


prompt_interest_levels_de(Interest, Title):-
    ((Interest == 'ML') ->
          sub1(InterestLevel)
    ;
    (Interest == 'DBSI') ->
          sub2(InterestLevel)
    ;
    (Interest == 'GA') ->
          sub3(InterestLevel)
    ;
    (Interest == 'DM') ->
          sub4(InterestLevel)
    ;

    (Interest == 'NLP') ->
          sub5(InterestLevel)
    ;

    (Interest == 'DW') ->
          sub6(InterestLevel)
    ;
    write("")

    ),
    interest_in_subject('DSA' , Knowledge1),
    interest_in_subject('DBMS' , Knowledge2),
    interest_in_subject('GR' , Knowledge3),
    interest_in_subject('LA' , Knowledge4),
    interest_in_subject('ST' , Knowledge5),

    (( Interest == 'DM' , Knowledge1 >= 1 , Knowledge2 >= 2 , Knowledge3 >= 1 , Knowledge4 >= 2  , Knowledge5 >= 2  ) ->
        Sub1 = 'DMG',
        save_result(Sub1)
   ;

   (  Interest == 'DBSI'  , Knowledge1 >= 2 , Knowledge2 >= 3    ) ->
         Sub1 = 'DBSI',
         save_result(Sub1)

  ;
  (  Interest == 'ML' , Knowledge1 >= 2 , Knowledge4 >= 3 , Knowledge5 >= 3   ) ->
    Sub1 = 'ML',
    save_result(Sub1)
   ;

  (  Interest == 'NLP'  , Knowledge1 >=  2 , Knowledge2 >= 2 , Knowledge3 >=2 , Knowledge4 >= 2  ) ->
    Sub1 = 'NLP',
    save_result(Sub1)
   ;
    ( Interest  == 'GA' , Knowledge1 >= 3   ) ->
    Sub1 = 'GA',
    save_result(Sub1)
   ;
    (  Interest == 'DW'  , Knowledge2 >=  4   ) ->

         Sub1 = 'DW',
         save_result(Sub1)

  ;



      write("")

   ),

    assertz(interest_in_subject(Interest , Interest_Level)).


prompt_interest_levels_is(Interest, Title):-
    /*write("Level of interest in "),
    write(Title),
    read(Interest_Level),*/
    ((Interest == 'TMC') ->
          sub1(InterestLevel)
    ;
    (Interest == 'NSC') ->
          sub2(InterestLevel)
    ;
    (Interest == 'AC') ->
          sub3(InterestLevel)
    ;
    (Interest == 'PSOSM') ->
          sub4(InterestLevel)
    ;

    write("")

    ),
    interest_in_subject('DSA' , Knowledge1),
    interest_in_subject('CN' , Knowledge2),
    interest_in_subject('OS' , Knowledge3),
    interest_in_subject('DMA' , Knowledge4),
    course('CNC' , Course ),

    (( Interest == 'TMC', Knowledge2 >= 2 ,Course == 'Y'    ) ->
        Sub1 = 'TMC',
        save_result(Sub1)
   ;



    ( Interest == 'AC' , Knowledge4 >= 2  ) ->
    Sub1 = 'AC',
    save_result(Sub1)
   ;

  (  Interest == 'NSC'  , Knowledge2 >= 3  , Knowledge3 >= 3  ) ->
    Sub1 = 'NSC',
    save_result(Sub1)
   ;

    (  Interest == 'PSOSM'  , Knowledge1 >=  2 , Knowledge4 >= 1   ) ->

         Sub1 = 'PSOSM',
         save_result(Sub1)

  ;



      write("")

   ),

    assertz(interest_in_subject(Interest , Interest_Level)).

prompt_interest_levels_g(Interest, Title):-
    ( (Interest == 'ML') ->
          sub1(InterestLevel)
    ;
    (Interest == 'AI') ->
          sub2(InterestLevel)
    ;
    (Interest == 'GA') ->
          sub3(InterestLevel)
    ;
    (Interest == 'TMC') ->
          sub4(InterestLevel)
    ;
    (Interest == 'DM') ->
          sub5(InterestLevel)
    ;
     (Interest == 'NLP') ->
          sub6(InterestLevel)
    ;
    (Interest == 'DL') ->
          sub7(InterestLevel)
    ;
    (Interest == 'DBSI') ->
          sub8(InterestLevel)
    ;

    (Interest == 'DW') ->
          sub9(InterestLevel)
    ;


    write("")

    ),

    interest_in_subject('DSA' , Knowledge1),
    interest_in_subject('CN' , Knowledge2),
    interest_in_subject('OS' , Knowledge3),
    interest_in_subject('DBMS' , Knowledge4),
    interest_in_subject('AP' , Knowledge5),


    (( Interest == 'TMC', Knowledge2 >= 2     ) ->
        Sub1 = 'TMC',
        save_result(Sub1)
   ;


     ( Interest  == 'GA' , Knowledge1 >= 3   ) ->
    Sub1 = 'GA',
    save_result(Sub1)
   ;
    (  Interest == 'DW'  , Knowledge2 >=  4   ) ->

         Sub1 = 'DW',
         save_result(Sub1)

  ;

( Interest == 'DM' , Knowledge1 >= 1 , Knowledge2 >= 2 , Knowledge3 >= 1 , Knowledge4 >= 2  , Knowledge5 >= 2  ) ->
        Sub1 = 'DMG',
        save_result(Sub1)
   ;

    ( Interest == 'ML' , Knowledge1 >=  2 , Knowledge2 >= 3 , Knowledge3 >= 3 , Knowledge4 >= 2 ) ->
        Sub1 = 'ML',
        save_result(Sub1)
   ;

   ( Interest  == 'DL'  ) ->

         Sub1 = 'DL',
         save_result(Sub1)

  ;
    ( Interest  == 'AI' , Knowledge1 >= 3  ) ->
    Sub1 = 'AI',
    save_result(Sub1)
   ;
( Interest  == 'NLP'  , Knowledge1 >=  2 , Knowledge2 >= 2 , Knowledge3 >=2 , Knowledge4 >= 2   ) ->
    Sub1 = 'NLP',
    save_result(Sub1)
   ;

    (  Interest == 'DBSI'  , Knowledge1 >= 2 , Knowledge2 >= 3    ) ->
         Sub1 = 'DBSI',
         save_result(Sub1)

  ;

      write("")

   ),

    assertz(interest_in_subject(Interest , Interest_Level)).


% Displaying parameters for finding curiosity/interest.
interest_instructions:-
    nl,
    write("Thank You for selecting your Specialization"),nl,
    write("As a final step, please enter your interest in the selected domain."),nl,
    write("Enter a value from 0 to 5, 0 meaning no interest and 5 meaning highly interested:"),nl,nl,
    write("0 - No interest"),nl,
    write("1 - Low interest"),nl,
    write("2 - Medium interest"),nl,
    write("3 - High interest"),nl,
    write("4 - Very high interest"),nl,
    write("5 - Completely intrigued and fascinated"),nl,nl.


knowledge_in_subject1(Sub, Desc):-
   /* write("Amount of knowledge in "),
    write(Sub),
    write("-"),
    write(Desc),
    write(" "),
    read(Interest),*/
    subgen1(Interest),
    assertz(interest_in_subject(Sub, Interest)). % assert means store into memory

knowledge_in_subject2(Sub, Desc):-
    subgen2(Interest),
    assertz(interest_in_subject(Sub, Interest)). % assert means store into memory
knowledge_in_subject3(Sub, Desc):-
    subgen3(Interest),
    assertz(interest_in_subject(Sub, Interest)). % assert means store into memory
knowledge_in_subject4(Sub, Desc):-
    subgen4(Interest),
    assertz(interest_in_subject(Sub, Interest)). % assert means store into memory
knowledge_in_subject5(Sub, Desc):-
    subgen5(Interest),
    assertz(interest_in_subject(Sub, Interest)). % assert means store into memory
knowledge_in_subject6(Sub, Desc):-
    subgen6(Interest),
    assertz(interest_in_subject(Sub, Interest)). % assert means store into memory
knowledge_in_subject7(Sub, Desc):-
    subgen7(Interest),
    assertz(interest_in_subject(Sub, Interest)). % assert means store into memory


courses(Cou , Desc):-
   /* write("Have you done any "),
    write(Desc),
    write(" (Y/N)"),
    read(Course),*/
    cour(Course),
    assertz(course(Cou , Course )).

projects(Project , Descrip):-
    /*write("Have you done any "),
    write(Descrip),
    write(" (Y/N)"),
    read(ProjDone),*/
    proj(ProjDone),
    assertz(project(Project , ProjDone )).




% set of questions to be asked for the chosen specialisation by the user.
% Artificial Intelligence
ai_menu:-
    clear,
    clear_r ,
    knowledge_in_subject1('DSA' , "Data Structure and Algorithm"),
    knowledge_in_subject2('LA' , "Linear Algebra"),
    knowledge_in_subject3('CA' , "Calculus"),
    knowledge_in_subject4('PS' , "Probability and Statistics"),
    courses('MLC' , "Machine Learning Course"),
    projects('MLP' , "Machine Learning Project"),
    save,
    prompt_interest_levels_ai('ML', "Model real-world problems, apply different learning techniques and quantitatively evaluate the performance?"),
    prompt_interest_levels_ai('AI', "various search techniques, knowledge representation, reasoning, and learning?"),
    prompt_interest_levels_ai('GA', "design and analyse algorithms using techniques like divide and conquer, greedy and dynamic programming?"),
    prompt_interest_levels_ai('DMG', "learn techniques designed to be used for finding interesting patterns from data?"),
    prompt_interest_levels_ai('NLP', "get hands-on experience on designing different real-world NLP models?"),
    prompt_interest_levels_ai('DL', "be able to design intelligent deep learning systems for solving the problems in your area of interest?"),
    save.

% set of questions to be asked for the chosen specialisation by the user.
% Data Engineering
de_menu:-
    clear,
    clear_r ,
     knowledge_in_subject1('DSA' , "Data Structure and Algorithm"),
     knowledge_in_subject2('DBMS' , "Database Management"),
     knowledge_in_subject3('GR' , "Graphical Representation"),
     knowledge_in_subject4('LA' , "Linear Algebra"),
     knowledge_in_subject5('ST' , "Statistics"),
     save,
     prompt_interest_levels_de('ML', "Model real-world problems, apply different learning techniques and quantitatively evaluate the performance?"),
     prompt_interest_levels_de('DBSI', "topics relating to components of a Database System including file structures, transactions, concurrency control, recovery?"),
    prompt_interest_levels_de('GA', "design and analyse algorithms using techniques like divide and conquer, greedy and dynamic programming?"),
    prompt_interest_levels_de('DMG', "learn techniques designed to be used for finding interesting patterns from data?"),
    prompt_interest_levels_de('NLP', "get hands-on experience on designing different real-world NLP models?"),
    prompt_interest_levels_de('DW', "get hands on learning for the development life cycle of a data warehouse?"),
    save.

% set of questions to be asked for the chosen specialisation by the user.
% Information Security
is_menu:-
    clear,
    clear_r ,
    knowledge_in_subject1('DSA' , "Data Structure and Algorithm"),
    knowledge_in_subject2('CN' , "Computer Network"),
    knowledge_in_subject3('OS' , "Operating System"),
    knowledge_in_subject4('DMA' , "Discrete Mathematics"),
    courses('CNC' , "Course in Computer Network"),
    save,
    prompt_interest_levels_is('TMC', "learn about three basic principles of Modern Cryptography?"),
    prompt_interest_levels_is('NSC', "learn cryptosystems based on block ciphers, stream ciphers, public-key cryptosystems, key management, and digital signatures?"),
    prompt_interest_levels_is('AC', "learn about Security notions, adversary powers, Perfect security, Message authentication, Public key cryptography?"),
    prompt_interest_levels_is('PSOSM', "various privacy and security concerns (spam, phishing, fraud nodes, identity theft) on Online Social Media?"),
    save.

% set of questions to be asked for the chosen specialisation by the user.
% No Specialization
ws_menu:-
    clear,
    clear_r ,
    knowledge_in_subject1('DSA' , "Data Structure and Algorithm"),
    knowledge_in_subject2('CN' , "Computer Network"),
    knowledge_in_subject3('OS' , "Operating System"),
    knowledge_in_subject4('DBMS' , "Database Management"),
    knowledge_in_subject5('AP' , "Advanced Programming"),
    knowledge_in_subject6('PS' , "Probability and Statistics"),
    knowledge_in_subject7('LA' , "Linear Algebra"),
    save,
    prompt_interest_levels_g('ML', "Model real-world problems, apply different learning techniques and quantitatively evaluate the performance?"),
    prompt_interest_levels_g('AI', "various search techniques, knowledge representation, reasoning, and learning.?"),
    prompt_interest_levels_g('GA', "design and analyse algorithms using techniques like divide and conquer, greedy and dynamic programming?"),
    prompt_interest_levels_g('TMC', "learn about three basic principles of Modern Cryptography?"),
    prompt_interest_levels_g('DMG', "learn techniques designed to be used for finding interesting patterns from data?"),
    prompt_interest_levels_g('NLP', "get hands-on experience on designing different real-world NLP models?"),
    prompt_interest_levels_g('DL', "be able to design intelligent deep learning systems for solving the problems in your area of interest?"),
    prompt_interest_levels_g('DBSI', "topics relating to components of a Database System including file structures, transactions, concurrency control, recovery?"),
    prompt_interest_levels_g('DW', "get hands on learning for the development life cycle of a data warehouse?"),
    save.


% to save the new temporary info
save:-
    %tell('C:/Users/aayus/Desktop/AI Assignment/Assignment_1/temp1.pl'),
    tell('D:/Prolog/A1-AI-Aayush Kumar-MT22001/temp1.pl'),
    listing(interest_in_subject),
    listing(course),
    listing(project),
    told.

specialization('Artificial Intelligence'):-
    %interest_instructions,
    ai_menu,
    output.

specialization('Data Engineering'):-
    %interest_instructions,
    de_menu,
    output.

specialization('Information Security'):-
    %interest_instructions,
    is_menu,
    output.

specialization('No Specialization'):-
    %interest_instructions,
    ws_menu,
    output.






