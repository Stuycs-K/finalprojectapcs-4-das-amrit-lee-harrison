PERIOD 4
Amrit Das, Harrison Lee
Group Name: TBD[Harrison out on Monday]

Our project aims to create a digital Scrabble game, with useful consumer interactions. We will use code to go through dictionaries in order to load words which have 7-letters and then use things like classes in order to create tiles. Currently, our vision is that we can have an overarching "Tile" class where the players can use and interact with these tiles to play the game. We believe we will need to get better and taking in user input--especially a sort of drag function. (Harrison--edit/add more here after AP on Monday)
# Technical Details:
A description of your technical design. This should include: 
How you will be using the topics covered in class in the project.

We plan to use a wide array of tools/topics covered in class for this project. For starters, we will be using the Object-Oriented Programming dynamic--especially Polymorphism and Inheritance. We plan to use different classes such as: Tile, Player, Puzzle, Dictionary in order to help the game stay interactive yet true to its original meaning which is to be a fun game for all to play. Additionally, we can potentially use ideas such as Maze Carving, randomness, and recursion in order to create the board for the play(ers). The plan is to use the ArrayList in order to contain all necessary data: dictionary words, current status/positions on the board, and potential letters that can be drawn. We realize that with the skills learned in class, this game can become highly customizable for the players. We need to ensure that once a game starts, though, the class objects don't randomly capsize or cause issues. 


     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

Harrison- Diagrams


![image](https://github.com/user-attachments/assets/ef51e1e5-c39a-4802-9ca0-404d57d006fb)



Classes- Tile, Board, PlayerAccess, ArrayList, Word

The Tile class will be the Parent class of this game. It will have the child of the Board. The constructor for a Tile will be letter, type, size, position(x and y coordinate). We will also implement the use of dictionaries here.

The Board class will be a child class of the Tile and will use the lessons learned from Maze Carver and our wildfire modeling in order to create the board where the player can play. We will implement modifications in order to ensure that the board is playable and in order to collect important data, most notably, the length of the word.

The PlayerAcess will utilize multiple ArrayLists and is the main class that the player will be using.

    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

Phase 1(deadline- Tuesday after Memorial Day): After finalizing details, two things: 1) Find the dictionary(dictionaries) we want to use. 2) Start coding on the Tile Class

Phase 2(deadline- 5/30): 1) Start working on animation part of the game and try to figure out how to work on not making the game lag

Phase 3(deadline-6/6): 1) Ensuring the game actually works

Phase 4(deadline- 6/13[due date]): 1) Debugging and adding anything potentially useful



