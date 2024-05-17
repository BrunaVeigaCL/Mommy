//
//  PopUpView.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 14/05/24.
//

import SwiftUI

struct PopUpView: View {
    
    @State var name: String = ""
    @State var frequencia: Int = 1
    @State var ultimaVez: Int = 1
    @State var duracao: Int = 5
    @State var star1: Bool = false
    @State var star2: Bool = false
    @State var star3: Bool = false
    @State var star4: Bool = false
    @State var star5: Bool = false
    @Binding var isActive: Bool
    @Binding var atividades: [Atividade]
    
    var body: some View {

        
        if isActive {
            ZStack {
                Color.black.opacity(0.3)
                
                VStack (alignment: .leading, spacing: 0.0) {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {isActive = false}) {
                            Text("SAIR")
                                .font(.exitText)
                                .foregroundStyle(.exitButton)
                        }
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("NOME DA ATIVIDADE:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.activityTemplate)
                                .cornerRadius(6.0)
                                .frame(height: 35)
                            TextField("ex. varrer casa",
                                      text: $name)
                            .padding()
                            
                        }
                        .font(.activitySubtitle)
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("FREQUÊNCIA:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        HStack {
                            
                            Text("A CADA")
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 60)
                                    .frame(height: 30)
                                    .foregroundColor(.activityTemplate)
                                    .cornerRadius(6.0)
                                
                                Picker("Picker de frequencia", selection:
                                    $frequencia) {
                                    
                                    ForEach(1 ... 365, id: \.self) { number in
                                        Text(String(number)).tag(number)
                                    }
                                    
                                }
                                .pickerStyle(.menu)
                                .frame(minWidth: 90)
                            }
                            
                            
                            Text("DIAS")
                            
                        }
                        .font(.popupText)
                        .foregroundStyle(.mainText)
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("ÚLTIMA VEZ QUE FIZ:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        HStack {
                            
                            Text("HÁ")
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 60)
                                    .frame(height: 30)
                                    .foregroundColor(.activityTemplate)
                                    .cornerRadius(6.0)
                                
                                Picker("Picker de frequencia", selection:
                                    $ultimaVez) {
                                    
                                    ForEach(1 ... 365, id: \.self) { number in
                                        Text(String(number)).tag(number)
                                    }
                                    
                                }
                                .pickerStyle(.menu)
                            .frame(minWidth: 90)
                            }
                            
                            Text("DIAS")
                            
                        }
                        .font(.popupText)
                        .foregroundStyle(.mainText)
                        
                    }
                    .padding()

                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        Text("DURAÇÃO:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        
                        ZStack {
                            Picker("Picker de duracao", selection:
                                $duracao) {
                                
                                ForEach(1 ... 12, id: \.self) { number in
                                    
                                    if number == 12 {
                                        Text("+1h").tag(number)
                                    } else {
                                        Text("\(String(number*5)) min").tag(number)
                                    }
                                    
                                }
                                
                            }
                                .pickerStyle(.wheel)
                                .colorMultiply(.blue)
                        }
                        .frame(height: 100)
                      
                        
                        
                        
                        
                    }
                    .padding()
                        
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text("O QUANTO GOSTO:")
                            .font(.header)
                            .foregroundStyle(.mainText)
                        
                        HStack {
                            Button(action: {
                                if star1 == true {
                                    star1 = false
                                    star2 = false
                                    star3 = false
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                }
                            }) { 
                                
                                if star1 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 30)
                                }
                    
                            }
                            
                            Button(action: {
                                if star2 == true {
                                    star2 = false
                                    star3 = false
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                    star2 = true
                                }
                            }) {
                                if star2 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                            }
                            
                            Button(action: {
                                if star3 == true {
                                    star3 = false
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                    star2 = true
                                    star3 = true
                                }
                            }) {
                                if star3 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                            }
                            
                            Button(action: {
                                if star4 == true {
                                    star4 = false
                                    star5 = false
                                } else {
                                    star1 = true
                                    star2 = true
                                    star3 = true
                                    star4 = true
                                }
                            }) {
                                if star4 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                            }
                            
                            Button(action: {
                                if star5 == true {
                                    star5 = false

                                } else {
                                    star1 = true
                                    star2 = true
                                    star3 = true
                                    star4 = true
                                    star5 = true
                                }
                            }) {
                                if star5 == true {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                } else {
                                    Image(systemName: "star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 30)
                                }
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.main)
                        
                    }
                    .padding()
                    
                    
                    Button(action: {
                        if name != "" {
                            adicionarAtividade()
                            print(atividades)
                            isActive = false
                        } else {
                            
                        }
                    }) {
                        ZStack {
                            if name != "" {
                                Color.main
                            } else {
                                Color.offButton
                            }
                            Text("COMPUTAR")
                                .foregroundStyle(.fundo)
                                .font(.buttonText)
                        }
                    }
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6.0)
                    .padding()
                    
                    
                }
                .frame(width: 350.0, height: 630.0)
                .background(.fundo)
                .textFieldStyle(.plain)
                .keyboardType(.default)
                .cornerRadius(10.0)
                .padding()
                
            }
            .ignoresSafeArea()
            .onAppear(perform: {
                name = ""
                frequencia = 1
                ultimaVez = 1
                duracao = 5
                star1 = false
                star2 = false
                star3 = false
                star4 = false
                star5 = false
            })
        } else {
            EmptyView()
        }
            
    }
    
    func adicionarAtividade () {
        
        var stars: Int
        
        if star5 == true {
            stars = 5
        } else if  star4 == true {
            stars = 4
        } else if  star3 == true {
            stars = 3
        } else if  star2 == true {
            stars = 2
        } else if  star1 == true {
            stars = 1
        } else {
            stars = 0
        }
        
        let activity: Atividade = .init(nome: name, frequencia: frequencia, ultimaVez: ultimaVez, duracao: duracao, gosto: stars)
        
        
        atividades.append(activity)
        
        atividades.sort {
            $0.nota > $1.nota
        }
    }
    
}

#Preview {
    PopUpView(isActive: .constant(true), atividades: .constant([
        Atividade(nome: "teste", frequencia: 10, ultimaVez: 10, duracao: 10, gosto: 20)
    ]))
}
