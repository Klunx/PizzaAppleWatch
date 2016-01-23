//
//  InterfaceController.swift
//  PizzaAppleWatch WatchKit Extension
//
//  Created by Fernando Renteria on 18/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, PizzaInicioDelegate {

    @IBOutlet var inicioBtn: WKInterfaceButton!
    var pizzaInicio: Pizza  = Pizza()
    
    @IBAction func iniciarPedido() {
        print("Iniciar Pedido")
        pizzaInicio.delegate = self
        pushControllerWithName("OpTamanio", context: pizzaInicio)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func pizzaInicioDidFinish(context:AnyObject?) {
        pizzaInicio = context as! Pizza
    }
}
