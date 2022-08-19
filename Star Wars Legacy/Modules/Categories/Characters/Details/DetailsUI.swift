//
//  DetailsUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 16/06/22.
//

import SwiftUI

struct DetailsUI: View {
    
    var character: Character
    @StateObject private var imageLoader = ImageLoader()
    @StateObject private var viewModel = DetailsViewModel()
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
               
                ZStack {
                    AsyncImage(url: URL(string: imageLoader.getImageURL(character.url, categorie: .characters))) {
                        $0.resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                    } placeholder: {
                        PlacerHolderUI()
                        .clipShape(Circle())
                    }
                    
                    Circle()
                        .stroke(lineWidth: 5)
                        .foregroundColor(.yellow)
                        
                }
                
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                
                VStack {
                    
                    SectionHeader(text: DetailsLocalizedStrings.swPersonalInfo)
                    
                    InfoRows(textLeft: DetailsLocalizedStrings.swHeight,
                             textRight: character.height)
                    
                    InfoRows(textLeft: DetailsLocalizedStrings.swMass,
                             textRight: character.mass)
                    
                    InfoRows(textLeft: DetailsLocalizedStrings.swBirthYear,
                             textRight: character.birthYear)
                    
                    InfoRows(textLeft: DetailsLocalizedStrings.swGender,
                             textRight: character.gender)
                    
                    InfoRows(textLeft: DetailsLocalizedStrings.swSkinColor,
                             textRight: character.skinColor)
                    
                    InfoRows(textLeft: DetailsLocalizedStrings.swEyeColor,
                             textRight: character.eyeColor)
                    
                    InfoRows(textLeft: DetailsLocalizedStrings.swHairColor,
                             textRight: character.hairColor)
                   
                }
                .padding()
                
                VStack {
                    
                    SectionHeader(text: DetailsLocalizedStrings.swHomeworld)
                    ZStack(alignment: .bottom) {
                        
                        AsyncImage(url: URL(string: imageLoader.getImageURL(character.homeworld, categorie: .planets))){
                            $0.resizable()
                                .frame(minWidth: CGFloat.zero,
                                       maxWidth: 200,
                                       minHeight: 100,
                                       maxHeight: 160)
                                
                            
                            Text(viewModel.homeworld?.name ?? DetailsLocalizedStrings.swHomeworld)
                                .foregroundColor(.yellow)
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.heavy)
                                .frame(minWidth: CGFloat.zero, maxWidth: 200, minHeight: 30, maxHeight: 50)
                                .background(Color.black
                                )
                        } placeholder: {
                            ZStack(alignment: .bottom) {
                                PlacerHolderUI()
                                
                                Text(viewModel.homeworld?.name ?? DetailsLocalizedStrings.swHomeworld)
                                    .foregroundColor(.yellow)
                                    .font(.system(.title, design: .rounded))
                                    .fontWeight(.heavy)
                                    .frame(minWidth: CGFloat.zero, maxWidth: 200, minHeight: 30, maxHeight: 50)
                                    .background(Color.black)
                            }
                            
                            
                        }
                    }
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.yellow, lineWidth: 3))
                    .onAppear {
                        viewModel.fetchHomeworld(url: character.homeworld)
                    }
                }
                .padding()
                
                VStack {
                    SectionHeader(text: DetailsLocalizedStrings.swFilms)
                }
                .padding()
                
                VStack {
                    SectionHeader(text: DetailsLocalizedStrings.swSpecies)
                }
                .padding()
                
                VStack {
                    SectionHeader(text: DetailsLocalizedStrings.swStarships)
                }
                .padding()
                
                VStack {
                    SectionHeader(text: DetailsLocalizedStrings.swVehicules)
                }
                .padding()
                
                Spacer()
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct InfoRows: View {
    
    var textLeft: String
    var textRight: String
    
    var body: some View {
        HStack {
            Text(textLeft)
                .font(.title2)
            
            Spacer()
            
            Text(textRight)
                .font(.title2)
                .bold()
        }
    }
    
}

struct SectionHeader: View {
    
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.title)
                .bold()
                .foregroundColor(.yellow)
            
            Spacer()
        }
    }
    
}

struct DetailsUI_Previews: PreviewProvider {
    var data: Character
    static var previews: some View {
        DetailsUI(character: Character(
            name: "Luke",
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
            "https://swapi.py4e.com/api/films/7/"
            ],
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

