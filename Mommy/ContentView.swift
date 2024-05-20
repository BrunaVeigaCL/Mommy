//
//  ContentView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 13/05/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var isPopupActive: Bool = false
    @State var isInformationActive: Bool = false
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
                        
                        Image(systemName: "info.circle")
                            .padding(.top)
                            .opacity(0.0)
                        
                        Spacer()
                        
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .resizable()
                            .frame(height: 32)
                            .frame(width: 28)
                        
                        Text("MOMMY")
                            .font(.custom("NerkoOne-Regular", size: 50))
                        
                        Spacer()
                        
                        Button(action: {
                            isInformationActive = true
                        }){
                            Image(systemName: "info.circle")
                                .padding(.top)
                        }
                            
                        
                    }
                    .foregroundColor(.white)
                    .padding(.top, 85.0)
                    .padding(.horizontal)
                }
                
//                Text ("ORGANIZE SUAS ATIVIDADES EM ORDEM DE PRIORIDADE")
//                    .font(.activityTitle)
//                    .foregroundColor(.mainText)
//                    .multilineTextAlignment(.center)
//                    .padding(15)
                
                
                ScrollView {
                    VStack (spacing: 27.0) {
                        ForEach (0..<atividades.count, id: \.self) { atv in
                            
                            ActivitysView(activity: $atividades[atv], didTapRemove: {
                                
                                atividades.remove(at: atv)
                                
                            }, opacidade: getActivityOpacity(index: atv, totalCount: atividades.count), didTapRemoveAll: {
                                
                                atividades.removeAll()
                                
                            })
                            
                        }
                    }
                    .padding(.top, 27)
                }
                
                
                Button(action: {
                    isPopupActive = true
                }) {
                    ZStack{
                        Color.main
                        HStack (spacing: 15.0) {
                            Text("ADICIONAR ATIVIDADE")
                                .foregroundStyle(.white)
                                .font(.buttonText)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .foregroundColor(.fundo)
                        }
                    }
                }
                .frame(width: 350,height: 55)
                .cornerRadius(10)
                .padding(.bottom)
                
                Spacer()
                
            }
            .ignoresSafeArea(.container, edges: [.top])
            .padding()
            
            PopUpView(isPopupActive: $isPopupActive, atividades: $atividades)
            InformationView(isInformationActive: $isInformationActive)
        }
        .ignoresSafeArea()
    }

    func getActivityOpacity (index: Int, totalCount: Int) -> Double {
        1.0 - Double(index)/Double(totalCount)
    }
}

#Preview {
    ContentView()
}
