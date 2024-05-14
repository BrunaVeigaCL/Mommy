//
//  ContentView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {}) {
                ZStack{
                    Color.main
                    Text("ADICIONAR ATIVIDADE")
                        .foregroundStyle(.white)
                        .font(.buttonText)
                }
            }
            .frame(width: 350,height: 55)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
