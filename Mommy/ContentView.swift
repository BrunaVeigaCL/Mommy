//
//  ContentView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 13/05/24.
//

import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Atividade.nota) private var atividades: [Atividade]
    @State private var crateNewActivity = false
    
    @State var isPopupActive: Bool = false
    @State var isInformationActive: Bool = false
    @State var tentouApagar: Bool = false
    @State var tentouApagarTudo: Bool = false
    
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
                } // Retangulo do título
                
                ScrollView {
                    VStack (spacing: 27.0) {
                        ForEach (atividades) { atv in
                            
                            HStack (alignment: .center, spacing: 20){
                                
                                ZStack {
                                    Circle()
                                        .scaledToFit()
                                        .frame(width: 80)
                                        .foregroundColor(.activity)
                                        .opacity(atv.opacidade)
                                    
                                    let notaCom1CasaDec = String(format: "%.1f", atv.nota)
                                    
                                    Text("\(notaCom1CasaDec)")
                                        .font(.activityNote)
                                        .foregroundStyle(.fundo)
                                }
                                
                                VStack (alignment: .leading) {
                                    
                                    Text(atv.nome)
                                        .font(.activityTitle)
                                        .foregroundStyle(.mainText)
                                    Text("REALIZADA HÁ \(atv.ultimaVez) DIAS")
                                        .font(.activitySubtitle)
                                        .foregroundStyle(.main)
                                    if atv.duracao == 60 {
                                        Text("+1 h")
                                            .font(.activitySecondSubtitle)
                                            .foregroundStyle(.tertiaryText)
                                    } else {
                                        Text("\(atv.duracao) min")
                                            .font(.activitySecondSubtitle)
                                            .foregroundStyle(.tertiaryText)
                                    }
                                    
                                }
                                Spacer()
                                
                                Button(action: {
                                    tentouApagar = true
                                }) {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20)
                                        .foregroundColor(.mainText)
                                }
                                
                            }
                            .padding(.horizontal, 25.0)
                            .alert("Você tem certeza?", isPresented: $tentouApagar) {
                                Button("Apagar atividade", role: .destructive) {
                                    context.delete(atv)
                                    
                                }
                                Button("Cancelar", role: .cancel, action: {})
                                Button("Apagar todas as atividades", role: .destructive) {
                                    tentouApagarTudo = true
                                }
                            }
                            .confirmationDialog("Isso apagará toda a sua lista", isPresented: $tentouApagarTudo, titleVisibility: .visible) {
                                Button("OK", role: .cancel, action: {})
                                
                                Button("Apagar Tudo", role: .destructive) {
                                    //modelContext.delete(model: Atividade.self)
                                    do {
                                        try context.delete(model: Atividade.self)
                                    } catch {
                                        fatalError(error.localizedDescription)
                                    }
                                }
                            
                            }
                            
                        }   //  imprime minhas atividades cadastradas
                        
                    }
                    .padding(.top, 27)
                }
                
                
                Button(action: {
                    isPopupActive = true
                }) {    // Botão de adicionar atividade
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
            
            PopUpView(isPopupActive: $isPopupActive)   //  View do popup de adicionar
                
            InformationView(isInformationActive: $isInformationActive)  //  View do popup de informações
        }
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 0.2), value: isPopupActive)
        .animation(.easeInOut(duration: 0.5), value: isInformationActive)

    }
    
    

    func getActivityOpacity (index: Int, totalCount: Int) -> Double {
        1.0 - Double(index)/Double(totalCount)
    }
    
}

#Preview {
    ContentView()
}
