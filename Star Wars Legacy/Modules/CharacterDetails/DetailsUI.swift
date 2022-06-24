//
//  DetailsUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 16/06/22.
//

import SwiftUI

struct DetailsUI: View {
    
    var character: Character
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Characters")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(lineWidth: 5)
                        .foregroundColor(.yellow)
                        .frame(width: 200, height: 200))
                
                Text(character.name)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                    .padding()
                HStack{
                    Text("Personal Info")
                        .font(.title)
                        .foregroundColor(.yellow)
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 10)
                .padding(.horizontal)
                HStack {
                    
                    Text("Height:")
                        .bold()
                    Text(character.height)
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct DetailsUI_Previews: PreviewProvider {
    var data: Character
    static var previews: some View {
        DetailsUI(character: Character(
            name: "Luke Skywalker",
            height: "172",
            mass: "77",
            hairColor: "blond",
            skinColor: "fair",
            eyeColor: "blue",
            birthYear: "19BBY",
            gender: "male",
            homeworld: "https://swapi.py4e.com/api/planets/1/",
            films: [
            "https://swapi.py4e.com/api/films/2/",
            "https://swapi.py4e.com/api/films/6/",
            "https://swapi.py4e.com/api/films/3/",
            "https://swapi.py4e.com/api/films/1/",
            "https://swapi.py4e.com/api/films/7/"],
            species: ["https://swapi.py4e.com/api/species/1/"],
            starships: [
                "https://swapi.py4e.com/api/starships/12/",
                "https://swapi.py4e.com/api/starships/22/"
            ],
            vehicles: [
                "https://swapi.py4e.com/api/vehicles/14/",
                "https://swapi.py4e.com/api/vehicles/30/"
            ],
            created: "2014-12-09T13:50:51.644000Z",
            edited: "2014-12-20T21:17:56.891000Z",
            url: "https://swapi.py4e.com/api/people/1/"))
    }
}

