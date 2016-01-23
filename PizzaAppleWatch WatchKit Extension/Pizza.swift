//
//  Pizza.swift
//  PizzaAppleWatch
//
//  Created by Fernando Renteria on 18/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import WatchKit

class Pizza: NSObject {
    
    var tamanio: String = ""
    var masa: String  = ""
    var queso: String = ""
    var ingredientes: [String] = []
    var delegate:AnyObject? = nil
    
    func imprimePedido()->String {
        var impresionPedido = ""
        impresionPedido = "Tamaño: \(tamanio)\n"
        impresionPedido = impresionPedido.stringByAppendingString("Masa: \(masa)\n")
        impresionPedido = impresionPedido.stringByAppendingString("Queso: \(queso)\n")
        impresionPedido = impresionPedido.stringByAppendingString("Ingredientes:\n")
        for ingrediente in ingredientes {
            impresionPedido = impresionPedido.stringByAppendingString("\t \(ingrediente) \n")
        }
        return impresionPedido
    }
    

}
