//
//  vistaQueso.swift
//  PizzaAppleWatch
//
//  Created by Fernando Renteria on 19/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import WatchKit
import Foundation

// Protocol.
protocol PizzaQuesoDelegate {
    func pizzaQuesoDidFinish(context:AnyObject?)
}

// Pizza.
class vistaQueso: WKInterfaceController,PizzaIngredienteDelegate {
    // Objeto pizza para esta vista.
    var pizzaQueso: Pizza = Pizza()
    // Mapa para la pizza con queso.
    var pizzaQuesoMap = [Int:String]()
    // Delegate.
    var delegate:PizzaQuesoDelegate! = nil
    @IBOutlet var quesoLbl: WKInterfaceLabel!
    @IBOutlet var quesoPicker: WKInterfacePicker!
    

    @IBAction func agregarQuesoPedido(value: Int) {
        pizzaQueso.queso = String(pizzaQuesoMap[value]!)
        quesoLbl.setText("\(pizzaQueso.queso)")
        print(pizzaQueso.imprimePedido())
        let newContext:AnyObject? = pizzaQueso
        delegate.pizzaQuesoDidFinish(newContext)

    }
    
    @IBAction func agregarIngredientes() {
        if (pizzaQueso.queso == "") {
            pizzaQueso.queso = String(pizzaQuesoMap[0]!)
        }
        pizzaQueso.delegate = self
        pushControllerWithName("OpIngredientes", context: pizzaQueso)

    }
    
    func pizzaIngredienteDidFinish(context:AnyObject?){
        pizzaQueso = context as! Pizza
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        pizzaQueso = context as! Pizza
        
        pizzaQuesoMap[0] = "Mozarela"
        pizzaQuesoMap[1] = "Cheddar"
        pizzaQuesoMap[2] = "Parmesano"
        pizzaQuesoMap[3] = "Sin Queso"
        
        var quesoPickerItems = [WKPickerItem]()
        for var i = 0; i < pizzaQuesoMap.count; ++i {
            let pickerItem = WKPickerItem()
            pickerItem.title = pizzaQuesoMap[i]
            pickerItem.caption = "Queso"
            quesoPickerItems.append(pickerItem)
        }
        quesoPicker.setItems(quesoPickerItems)
        
        if (pizzaQueso.queso != "") {
            var indexForPicker :Int = 0
            for (key, value) in pizzaQuesoMap {
                if (value == pizzaQueso.queso) {
                    indexForPicker = key
                }
            }
            quesoPicker.setSelectedItemIndex(indexForPicker)
        }

        // Configure interface objects here.
        delegate = pizzaQueso.delegate as? PizzaQuesoDelegate
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
