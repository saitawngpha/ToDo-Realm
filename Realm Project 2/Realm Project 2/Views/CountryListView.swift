//
//  ContentView.swift
//  Realm Project 2
//
//  Created by Steve Pha on 1/25/23.
//

import SwiftUI
import RealmSwift

struct CountryListView: View {
    
    @ObservedResults(Country.self) var countries
    @FocusState private var isFocused: Bool?
    @State private var presentAlert = false
    var body: some View {
        NavigationView{
            VStack {
                if countries.isEmpty{
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) button above to create a new Country")
                }else{
                    List{
                        ForEach(countries.sorted(byKeyPath: "name")){ country in
                            NavigationLink {
                                CitiesListView(country: country)
                            } label: {
                                CountryRowView(country: country, isFocus: _isFocused)
                            }

                        }
                        .onDelete(perform: deleteCountry)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                
                Spacer()
            }//end vstack
            .animation(.default, value: countries)
            .navigationTitle("Countries")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        $countries.append(Country())
                    }label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button{
                            isFocused = nil
                        }label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            }
        }//end nav
        .alert("You must first delete all of the cities in this country.", isPresented: $presentAlert, actions: {})
    }
    
    func deleteCountry(indexSet: IndexSet){
        guard let index = indexSet.first else{ return }
        let selectedCountry = Array(countries.sorted(byKeyPath: "name"))[index]
        guard selectedCountry.cities.isEmpty else{
            //show alert
            presentAlert.toggle()
            return
        }
        $countries.remove(selectedCountry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
