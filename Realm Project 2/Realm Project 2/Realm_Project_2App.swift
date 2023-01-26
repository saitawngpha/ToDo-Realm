//
//  Realm_Project_2App.swift
//  Realm Project 2
//
//  Created by Steve Pha on 1/25/23.
// source: https://www.youtube.com/watch?v=XrmOR_Qv9Aw&list=PLBn01m5Vbs4B8xgS_iEEuJtM_3BuZ7fiV&index=4

import SwiftUI

@main
struct Realm_Project_2App: App {
    let migrator = Migrator()
    var body: some Scene {
        WindowGroup {
            TabView{
                CountryListView()
                    .tabItem {
                        Label("Countries", systemImage: "list.dash")
                    }
                
                AllCitiesListView()
                    .tabItem {
                        Label("Cities", systemImage: "list.dash")
                    }
            }
            
                .onAppear(){
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstrainBaseLayoutLogUnsatisfiable")
                }
        }
    }
}
