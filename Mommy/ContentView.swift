//
//  ContentView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 13/05/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var isActive: Bool = false
    @State var atividades: [Atividade] = []
    
    var body: some View {
        
        ZStack {
            VStack (spacing: 0.0){
                ZStack {
                    Rectangle()
                        .frame(width: 400)
                        .frame(height: 150)
                        .ignoresSafeArea()
                        .foregroundColor(.main)
                    
                    HStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .resizable()
                            .frame(height: 32)
                            .frame(width: 28)
                        
                        Text("MOMMY")
                            .font(.custom("NerkoOne-Regular", size: 50))
                        
                    }
                    .foregroundColor(.white)
                    .padding(.top, 45.0)
                }
                
                //Spacer()
                
                ScrollView {
                    VStack (spacing: 27.0) {
                        ForEach (0..<atividades.count, id: \.self) { atv in
                            
                            let opacidade = 1.0 - Double((atv)/atividades.count)
                            
                            ActivitysView(activity: $atividades[atv], didTapRemove: {
                                atividades.remove(at: atv)
                            }, opacidade: opacidade)
                            
                        }
                    }
                    .padding(.top, 27)
                }
                
                
                Button(action: {
                    isActive = true
                }) {
                    ZStack{
                        Color.main
                        Text("ADICIONAR ATIVIDADE")
                            .foregroundStyle(.white)
                            .font(.buttonText)
                    }
                }
                .frame(width: 350,height: 55)
                .cornerRadius(10)
                
                Spacer()
                
            }
            .ignoresSafeArea(.container, edges: [.top])
            .padding()
            
            PopUpView(isActive: $isActive, atividades: $atividades)
        }
        .ignoresSafeArea()
        
        
        
    }

}

#Preview {
    ContentView()
}
