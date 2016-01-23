//
//  vistaConfirmar.swift
//  PizzaAppleWatch
//
//  Created by Fernando Renteria on 23/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import WatchKit
import Foundation


class vistaConfirmar: WKInterfaceController {
    

    var pizzaConfirmar: Pizza = Pizza()

    @IBOutlet var lblImpresionPedido: WKInterfaceLabel!
    
    @IBAction func enviarPedido() {
        let cancel = WKAlertAction(title: "Cancelar", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            print("cancel")
        })
        
        let action = WKAlertAction(title: "Agregar", style: WKAlertActionStyle.Default, handler: { () -> Void in
            self.popToRootController()
        })
        presentAlertControllerWithTitle("Confirmar", message: "¿Estás seguro que quieres enviar tu pedido?", preferredStyle: .Alert, actions: [cancel,action])
    
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pizzaConfirmar = context as! Pizza
        lblImpresionPedido.setText(pizzaConfirmar.imprimePedido())
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

}
