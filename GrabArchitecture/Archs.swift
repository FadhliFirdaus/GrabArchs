//
//  Archs.swift
//  GrabArchitecture
//
//  Created by Fadhli Firdaus on 14/02/2024.
//

import Foundation

struct Arch {
    let archName:String
    let archDesc:String
}

let archData = [
    
    Arch(archName: "MVVM", archDesc: "MVVM in iOS separates an app's code into Model (data and logic), View (UI), and ViewModel (bridge between Model and View). ViewModels prepare data for display and handle user interactions, keeping Views lightweight. This pattern enhances code maintainability, testability, and modularity in iOS development."),
    
    Arch(archName: "MVC", archDesc: "MVC (Model-View-Controller) is an architectural pattern commonly used in iOS development. In MVC, the Model represents data and logic, the View represents the user interface, and the Controller acts as an intermediary, handling user input and updating both the Model and View accordingly. This pattern promotes separation of concerns, making code more organized and maintainable."),
    
    Arch(archName: "MV", archDesc: "Mohammad Azam's SwiftUI architecture simplifies the traditional MVVM pattern by eliminating the ViewModel layer. In his approach, Views directly interact with the Model, which acts as an aggregate root. This streamlines the architecture, leveraging SwiftUI's features for better performance. Azam advises embracing SwiftUI's capabilities instead of adding unnecessary complexity."),
    
    Arch(archName: "VIPER", archDesc: "VIPER (View, Interactor, Presenter, Entity, Router) is an iOS architectural pattern. It separates concerns into View, Interactor, Presenter, Entity, and Router, promoting modularity and testability in app development. Each component has a specific role, enhancing scalability and maintainability.")
]
