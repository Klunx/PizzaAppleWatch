//
//  vistaIngredientes.swift
//  PizzaAppleWatch
//
//  Created by Fernando Renteria on 19/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import WatchKit
import Foundation

// Protocol.
protocol PizzaIngredienteDelegate {
    func pizzaIngredienteDidFinish(context:AnyObject?)
}

class vistaIngredientes: WKInterfaceController {
    
    var pizzaIngredientes: Pizza = Pizza()
    var delegate:PizzaIngredienteDelegate! = nil
    
    @IBOutlet var ingJamon: WKInterfaceSwitch!
    @IBOutlet var ingPepperoni: WKInterfaceSwitch!
    @IBOutlet var ingPavo: WKInterfaceSwitch!
    @IBOutlet var ingSalchicha: WKInterfaceSwitch!
    @IBOutlet var ingAceituna: WKInterfaceSwitch!
    @IBOutlet var ingCebolla: WKInterfaceSwitch!
    @IBOutlet var ingPimiento: WKInterfaceSwitch!
    @IBOutlet var ingPiña: WKInterfaceSwitch!
    @IBOutlet var ingAnchoa: WKInterfaceSwitch!
    @IBOutlet var agregarOrderBtn: WKInterfaceButton!
    
    @IBAction func agregarJamon(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Jamón")
        if (!resultado) {
            ingJamon.setOn(resultado)
        }
    }
    
    @IBAction func agregarPepperoni(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Pepperoni")
        if (!resultado) {
            ingPepperoni.setOn(resultado)
        }
    }
    
    @IBAction func agregarPavo(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Pavo")
        if (!resultado) {
            ingPavo.setOn(resultado)
        }
    }
    
    @IBAction func agregarSalchicha(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Salchicha")
        if (!resultado) {
            ingSalchicha.setOn(resultado)
        }
    }
    
    @IBAction func agregarAceituna(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Aceituna")
        if (!resultado) {
            ingAceituna.setOn(resultado)
        }
    }
    
    @IBAction func agregarCebolla(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Cebolla")
        if (!resultado) {
            ingCebolla.setOn(resultado)
        }
    }
    
    @IBAction func agregarPimiento(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Pimiento")
        if (!resultado) {
            ingPimiento.setOn(resultado)
        }
    }
    
    @IBAction func agregarPinia(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Piña")
        if (!resultado) {
            ingPiña.setOn(resultado)
        }
    }
    
    @IBAction func agregarAnchoa(value: Bool) {
        let resultado: Bool = validarIngredientes(value, ingrediente: "Anchoa")
        if (!resultado) {
            ingAnchoa.setOn(resultado)
        }
    }
    
    @IBAction func agregarConfirmar() {

        if (pizzaIngredientes.ingredientes.count == 0) {
            // Validar ingredientes
            let action = WKAlertAction(title: "Action", style: WKAlertActionStyle.Default, handler: { () -> Void in
                print("Agregar Ingredientes..")
            })
            presentAlertControllerWithTitle("Stop!", message: "No olvides agregar ingredientes a tu pedido.", preferredStyle: .Alert, actions: [action])
            
        } else {
            pizzaIngredientes.delegate = self
            pushControllerWithName("OpConfirmar", context: pizzaIngredientes)
        
        }
    }
    
    func validarIngredientes(value: Bool, ingrediente: String)->Bool {
        var resultado: Bool = false
        if (value) {
            if (pizzaIngredientes.ingredientes.count < 5) {
                pizzaIngredientes.ingredientes.append(ingrediente)
                resultado = true
            } else {
                resultado = false
            }
        } else {
            let indexIngrediente: Int = pizzaIngredientes.ingredientes.indexOf(ingrediente)!
            pizzaIngredientes.ingredientes.removeAtIndex(indexIngrediente)
            resultado = true
        }
        
        print(pizzaIngredientes.imprimePedido())
        let newContext:AnyObject? = pizzaIngredientes
        delegate.pizzaIngredienteDidFinish(newContext)
        
        return resultado
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizzaIngredientes = context as! Pizza
        if (pizzaIngredientes.ingredientes.count != 0) {
            if (pizzaIngredientes.ingredientes.contains("Jamón")){
                ingJamon.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Pepperoni")){
                ingPepperoni.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Pavo")){
                ingPavo.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Salchicha")){
                ingSalchicha.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Aceituna")){
                ingAceituna.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Cebolla")){
                ingCebolla.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Pimiento")){
                ingPimiento.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Piña")){
                ingPiña.setOn(true)
            }
            if (pizzaIngredientes.ingredientes.contains("Anchoa")){
                ingAnchoa.setOn(true)
            }
        
        }
        // Configure interface objects here.
        delegate = pizzaIngredientes.delegate as? PizzaIngredienteDelegate
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
