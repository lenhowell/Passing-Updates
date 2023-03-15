//
//  ContentView.swift
//  Passing Updates
//
//  Created by Lenard Howell on 3/15/23.
//

import SwiftUI

class MyVariables: ObservableObject {

    @Published var numberOfEntry: Int
    @Published var name: String
    @Published var myDate: String
    
    init() {
        numberOfEntry = 0   // <- This is the original value, in the original code
        name = "Julie Schmitz"
        myDate = "12/01/2023"
    }
}

struct ContentView: View {
    @ObservedObject var model: MyVariables = MyVariables()

    model.name = "Nancy Howell"
    var myDate = "12/15/2023"
    
    var body: some View {
        VStack {
            Text(model.name)
            //            Spacer()
            Text(model.myDate)
        }
        DetailView().environmentObject(self.model) // send the model as an environment object

    }
}
struct DetailView: View {
//    @ObservedObject var model: MyVariables = MyVariables()
    @EnvironmentObject var model: MyVariables
    var name = "Dustin"
    var body: some View {
        VStack(spacing: 10) {        // ??? Had to add "return" when dateFormatter was added
            Text(model.name)
                .font(.title)
            Text(model.myDate)
            .buttonStyle(.borderedProminent)

            .padding()
            .font(.title3)
            .bold()

        }//VStack
    } // Body
}//Struct for Detail View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


