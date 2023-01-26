//
//  ToDos_RealmApp.swift
//  ToDos Realm
//
//  Created by Steve Pha on 1/24/23.
//

import SwiftUI

@main
struct ToDos_RealmApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .onAppear(){
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstrainBaseLayoutLogUnsatisfiable")
                }
        }
    }
}
