//
//  ContentView.swift
//  comp319a1
//
//  Created by Emir Fatih AYYILDIZ on 14.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var deck: [String] = []
    @State private var names: [String] = ["Ahmet", "Mehmet", "Emir", "Emre", "Ali",
                                          "Ayşe", "Zeynep", "Simge", "Sıla", "Fatma"]
    @State private var name1 = "."
    @State private var name2 = "."
    @State private var name3 = "."
    @State private var name4 = "."
    @State private var name5 = "."
    @State private var namesOnBoard = 3
    @State private var cantDraw = "Must Clear To Play"
    @State private var buttonTitle = "-Set-"
    
    var body: some View {
        
        VStack (spacing: .zero){
                
            
            Text("Click Draw To Get Names")
                .font(.title)
                .foregroundColor(.indigo)
                .bold()
                .padding(.vertical, 40)
                .padding(.horizontal,3)
                .fontDesign(.serif)
                .shadow(radius: 4)
                .brightness(0.18)
            
            Spacer()
            
            VStack{
                Text(name1)
                    .padding(.horizontal, 1)
                    .padding(.vertical,10)
                    .foregroundColor(.orange)
                    .font(.title3)
                    .bold()
                Text(name2)
                    .padding(.horizontal, 1)
                    .padding(.vertical, 10)
                    .foregroundColor(.yellow)
                    .font(.title3)
                    .bold()
                Text(name3)
                    .padding(.horizontal, 1)
                    .padding(.vertical,10)
                    .foregroundColor(.green)
                    .font(.title3)
                    .bold()
                Text(name4)
                    .padding(.horizontal, 1)
                    .padding(.vertical,10)
                    .foregroundColor(.mint)
                    .font(.title3)
                    .bold()
                Text(name5)
                    .padding(.horizontal, 1)
                    .padding(.vertical,10)
                    .foregroundColor(.purple)
                    .font(.title3)
                    .bold()
            }
            
            Spacer()
            
            HStack{
                
                Button(action: initializeDeck){
                    
                    
                    Text("Clear")
                        .font(.title)
                        .foregroundColor(.cyan)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                        .overlay{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.cyan, lineWidth: 4)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,10)
                }
                
                Button(action: drawName){
                    
                    
                    Text(buttonTitle)
                        .font(.title)
                        .foregroundColor(.red)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                        .overlay{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.red, lineWidth: 4)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal,10)
                }
                
            }
            Spacer()
        }
    }
    
    func initializeDeck() {
        deck.removeAll()
        for i in 0...9 {
            deck.append(names[i])
        }
        
        deck = deck.shuffled()
        
        name1 = "."
        name2 = "."
        name3 = "."
        name4 = "."
        name5 = "."
        namesOnBoard = 0
    }
    
    func drawName(){
        
        if namesOnBoard < 3 {
            namesOnBoard = namesOnBoard + 1
            
            if namesOnBoard == 1 {
                name3 = deck.removeFirst()
            }else if namesOnBoard == 2{
                name2 = name3
                name3 = "."
                name4 = deck.removeFirst()
            }else{
                name1 = name2
                name2 = "."
                name3 = name4
                name4 = "."
                name5 = deck.removeFirst()
            }
        }else{
            initializeDeck()
        }
        buttonTitle = namesOnBoard == 3 ? "-Set-" : "Draw"
    }
}



#Preview {
    ContentView()
}
