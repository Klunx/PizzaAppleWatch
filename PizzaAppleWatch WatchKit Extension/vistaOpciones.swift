//
//  vistaOpciones.swift
//  PizzaAppleWatch
//
//  Created by Fernando Renteria on 18/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import WatchKit
import Foundation

protocol PizzaInicioDelegate {
    func pizzaInicioDidFinish(context:AnyObject?)
}

class vistaOpciones: WKInterfaceController, PizzaDelegate{
    
    var pizzaOpciones: Pizza = Pizza()
    var pizzaTamaniosMap = [Int: String]()

    @IBOutlet var tamPicker: WKInterfacePicker!
    @IBOutlet var pizzaTam: WKInterfaceLabel!
    
    // Delegate.
    var delegate:PizzaInicioDelegate! = nil
    
    @IBAction func agregarTamanioPizza(value: Int) {
        pizzaOpciones.tamanio = String(pizzaTamaniosMap[value]!)        
        pizzaTam.setText("Tamaño: \(pizzaOpciones.tamanio)")
        print(pizzaOpciones.imprimePedido())
        let newContext:AnyObject? = pizzaOpciones
        delegate.pizzaInicioDidFinish(newContext)
    }
    
    @IBAction func agregarMasa() {
        if (pizzaOpciones.tamanio == "") {
            pizzaOpciones.tamanio = String(pizzaTamaniosMap[0]!)
        }
        pizzaOpciones.delegate = self
        pushControllerWithName("OpMasa", context: pizzaOpciones)

    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizzaOpciones = context as! Pizza
        
        pizzaTamaniosMap[0] = "Pequeña"
        pizzaTamaniosMap[1] = "Mediana"
        pizzaTamaniosMap[2] = "Grande"
        
        var tamPickerItems = [WKPickerItem]()
        for var i = 0; i < pizzaTamaniosMap.count; ++i {
            let pickerItem = WKPickerItem()
            pickerItem.title = pizzaTamaniosMap[i]
            pickerItem.caption = "Tamaño"
            tamPickerItems.append(pickerItem)
        }
        
        tamPicker.setItems(tamPickerItems)
        
        if (pizzaOpciones.tamanio != "") {
            var indexForPicker :Int = 0
            for (key, value) in pizzaTamaniosMap {
                if (value == pizzaOpciones.tamanio) {
                    indexForPicker = key
                }
            }
            tamPicker.setSelectedItemIndex(indexForPicker)
        }
        
        delegate = pizzaOpciones.delegate as? PizzaInicioDelegate
        // Configure interface objects here.
    }
    
    func pizzaDidFinish(context:AnyObject?) {
        pizzaOpciones = context as! Pizza
        
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
