//
//  ContentView.swift
//  Realm Intro-3
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI
import RealmSwift

struct CountriesListView: View {
    @EnvironmentObject var realmManager: RealmManager
    @ObservedResults(Country.self) var countries
    @FocusState private var isFocused: Bool?
    //@State private var presentAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                if let countries = realmManager.searchResults {
                    List {
                        ForEach(countries.sorted{$0.name < $1.name}) { country in
                            if !country.isInvalidated {
                                NavigationLink {
                                    CitiesListView(country: country)
                                } label: {
                                    CountryRowView(country: country, isFocused: _isFocused)
                                }
                            }
                        }
                        .onDelete(perform: deleteCountry)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .searchable(text: $realmManager.searchFilter, placement: .navigationBarDrawer(displayMode: .always)) {
                        ForEach(countries) { country in
                            Text(country.name)
                                .searchCompletion(country.name)
                        }
                    }
                }
                
            }
            .animation(.default, value: realmManager.countries)
            .navigationTitle("Countries")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //                        $countries.append(Country())
                        realmManager.add(Country())
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button {
                            isFocused = nil
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            }
        }
        //.alert("You must first delete all of the cities in this country.", isPresented: $presentAlert, actions: {})
    }
    func deleteCountry(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let selectedCountry = realmManager.countriesArray.sorted{$0.name < $1.name}[index]
        realmManager.deleteCities(for: selectedCountry)
        realmManager.remove(selectedCountry)
        /**
         let selectedCountry = Array(countries.sorted(byKeyPath: "name"))[index]
         guard selectedCountry.cities.isEmpty else {
         // show alert
         presentAlert.toggle()
         return
         }
         $countries.remove(selectedCountry)
         */
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
            .environmentObject(RealmManager(name: "sample"))
    }
}
