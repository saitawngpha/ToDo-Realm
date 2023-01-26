//
//  AllCitiesListView.swift
//  Realm Project 2
//
//  Created by Steve Pha on 1/25/23.
//

import SwiftUI
import RealmSwift

struct AllCitiesListView: View {
    @ObservedResults(City.self, sortDescriptor: SortDescriptor(keyPath: "name")) var cities
    var body: some View {
        NavigationView{
            List{
                ForEach(cities){ city in
                    HStack{
                        Text(city.name)
                        Spacer()
                        Text(city.country.first?.name ?? "No Country")
                    }//end hstack
                }
                .onDelete(perform: $cities.remove)
            }
            .navigationBarTitle("All Cities")
        }//end nav
    }
}

struct AllCitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCitiesListView()
    }
}
