//
//  ContentView.swift
//  pizza-order-form
//
//  Created by Andrew Alsing on 4/25/23.
//

import SwiftUI

struct ContentView: View {
    enum PizzaSize: String, CaseIterable, Identifiable {
        case eight, twelve, twenty
        var id: Self { self }
    }

    @State var inputName = ""
    @State var inputAddress = ""
    @State var selectedSize: PizzaSize = .twelve
    @State var forPickup = false
    @State var isVegetarian = false

    var body: some View {
        Form {
            Section(header: Text("Name and Address")) {
                TextField("Name", text: $inputName)
                TextField("Address", text: $inputAddress)
            }
            Section(header: Text("Pickup or Delivery")) {
                Toggle("For Pickup", isOn: $forPickup)
            }
            Section(header: Text("Pizza Size and Vegetarian")) {
                Picker("Pizza Size", selection: $selectedSize) {
                    Text("8\"").tag(PizzaSize.eight)
                    Text("12\"").tag(PizzaSize.twelve)
                    Text("20\"").tag(PizzaSize.twenty)
                }
                .pickerStyle(SegmentedPickerStyle())
                Toggle("Vegetarian", isOn: $isVegetarian)
            }
            Section(header: Text("Order Summary")) {
                Text("\(inputName) ordered")
                Text("\(selectedSize.rawValue) inch pizza")
                Text("is vegetarian \(isVegetarian ? "Yes" : "No")")
            }
            Section {
                Button("Place Order") {
                    // do something when the button is tapped
                }
            }
        }
    }
}

