//
//  Atividade.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 16/05/24.
//

import Foundation

// Struct do tipo atividade, em variáveis desse tipo vou armazenar cada item meu

struct Atividade {
    var nome: String = ""
    var frequencia: Int
    var ultimaVez: Int
    var duracao: Int
    var gosto: Int
    var opacidade = 1.0

    var nota: Float {
        get {
            let razao1 = Float(ultimaVez) / Float(frequencia)
            let razao2 = Float(gosto) / 5
            return 8 * razao1 + 2 * razao2
        }
    }
    
}
