//
//  main.swift
//  TasKagitMakas
//
//  Created by Muazzez Aydın on 18.06.2023.
//

// Project 01 - Rock Paper Scissors Challange

import Foundation

enum GameVariables: String {
    case rock = "🪨"
    case paper = "📃"
    case scissors = "✂️"
}

enum Gamer{
    case computer
    case user
}

struct Score{
    var computerScore: Int = 0
    var userScore: Int = 0
}
var gameScore = Score()


func getComputerMove() -> GameVariables {
    let gamesVariable:[GameVariables] = [.paper, .rock, .scissors]
//    if let computerChoice = choice.randomElement(){
//        return computerChoice
//    }
//    return choice.rock
    return gamesVariable.randomElement()!
}

func wrongInput() {
    print("Hatalı Veri Girdiniz. 1-2-3 Değeerlerinden Biri İle Tekrar deneyiniz.")
}

func checkUserMove(move: String) -> GameVariables{
    switch(move){
    case "1":
        return GameVariables.rock
    case "2":
        return GameVariables.paper
    case "3":
        return GameVariables.scissors
    default:
        wrongInput()
        return setUserMove()
    }
}

func setUserMove() -> GameVariables{
    print("\nTaş(1) Kağıt(2) Makas(3) : ");
    if let input = readLine(){
        return checkUserMove(move: input)
    }
    else{
        wrongInput()
        return setUserMove()
    }
}

func calculateScore(winnerRound : Gamer){
    switch(winnerRound){
    case .user:
        gameScore.userScore += 1
        break
    case .computer:
        gameScore.computerScore += 1
        break
    }
}

func getScore (){
    print("\nResult -> you:\(gameScore.userScore) ~ computer:\(gameScore.computerScore)")
    if(gameScore.userScore > gameScore.computerScore){
        print("🎉 Sen Kazandın 🎉\n")
    }
    else if(gameScore.userScore < gameScore.computerScore){
        print("💻 Bilgisayar Kazandı 💻\n")
    }
    else{
        print("Sonuç Berabere 🤷🏻‍♀️\n")
    }
}

func roundResult(computerMove: GameVariables, userMove:GameVariables){
    if userMove == computerMove {
        print("Bu Berabere!")
    } else if (userMove == .rock && computerMove == .scissors) ||
        (userMove == .paper && computerMove == .rock) ||
        (userMove == .scissors && computerMove == .paper) {
         calculateScore(winnerRound: .user)
   } else {
    calculateScore(winnerRound: .computer)
   }

}


for _ in 1...3 {
    
    let userMove = setUserMove()
    let computerMove = getComputerMove()
    print("Computer : \(computerMove.rawValue)")
    print("You      : \(userMove.rawValue)")
    
    roundResult(computerMove: computerMove, userMove: userMove)
}

getScore()
