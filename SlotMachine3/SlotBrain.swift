//
//  SlotBrain.swift
//  SlotMachine3
//
//  Created by David Kuchta on 10/11/14.
//  Copyright (c) 2014 David Kuchta. All rights reserved.
//

import Foundation

class SlotBrain {
    class func unpackSlotsIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else if index == 2 {
                    slotRow3.append(slot)
                }
                else {
                    println("Error")
                }
            }
        }
        var slotInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotInRows
    }
    
    
    class func computeWinnings (slots: [[Slot]]) -> Int {
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
 
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true {
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
        }
 
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }

        
        return winnings
    }
    
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
}