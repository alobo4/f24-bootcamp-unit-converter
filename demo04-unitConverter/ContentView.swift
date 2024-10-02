//
//  ContentView.swift
//  demo04-unitConverter
//
//  Created by Alec Lobanov on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    
    let units = ["mL","Liters","Cups","Pints","Gallons"]
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    @State private var inputValue = 0.0
    @State private var inputUnit = "mL"
    @State private var outputUnit = "mL"
    
    var inputToMilliliter: Double {
        switch inputUnit {
        case "Liters":
            return inputValue * literToMilliliter
        case "Cups":
            return inputValue * cupToMilliliter
        case "Pints":
            return inputValue * pintToMilliliter
        case "mL":
            return inputValue
        default:
            return inputValue * gallonToMilliliter
        }
    }
    
    var output: Double{
        switch outputUnit {
        case "Liters":
            return inputToMilliliter / literToMilliliter
        case "Cups":
            return inputToMilliliter / cupToMilliliter
        case "Pints":
            return inputToMilliliter / pintToMilliliter
        case "mL":
            return inputToMilliliter
        default:
            return inputToMilliliter / gallonToMilliliter
        }

    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Input Value and Unit"){
                    TextField("Input Value", value: $inputValue, format:.number)
                    Picker("Select a Unit",selection: $inputUnit){
                        ForEach(units, id:\.self){unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Convert To"){
                    Picker("Select a Unit",selection: $outputUnit){
                        ForEach(units, id:\.self){unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output"){
                    Text("\(output,specifier: "%.2f")")
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}

#Preview {
    ContentView()
}
