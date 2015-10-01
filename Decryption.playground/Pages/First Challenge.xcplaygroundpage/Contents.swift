//: Playground - noun: a place where people can play

import UIKit
import Foundation


let encryptionDictionary:NSDictionary = ["a":"4B", "b":"48", "c":"49", "d":"4E", "e":"4F", "f":"4C","g":"4D","h":"42",	"i":"43",	"j":"40",	"k":"41",	"l":"46",	"m":"47",	"n":"44",	"o":"45",	"p":"5A","q":"5B","r":"58",	"s":"59",	"t":"5E",	"u":"5F",	"v":"5C",	"w":"5D",	"x":"52",	"y":"53",	"z":"50",
    
    "A":"6B", "B":"68", "C":"69", "D":"6E", "E":"6F", "F":"6C","G":"6D","H":"62",	"I":"63",	"J":"60",	"K":"61",	"L":"66",	"M":"67",	"N":"64",	"O":"65",	"P":"7A","Q":"7B","R":"78",	"S":"79",	"T":"7E",	"U":"7F",	"V":"7C",	"W":"7D",	"X":"72",	"Y":"73",	"Z":"70",
    
    "1":"1B","2":"18","3":"19","4":"1E", "5":"1F","6":"1C","7":"1D","8":"12","9":"13","0":"1A", "~":"54","!":"0B","@":"6A","#":"09","$":"0E","%":"0F","^":"74","&":"0C","*":"00","(":"02",")":"03","-":"07","+":"01","=":"17","_":"75", ",":"06", "<":"16",">":"14", "?":"15", "{":"51","}":"57","[":"71","]":"77","\\":"76","|":"56","\"":"08", "'":"0D", " ":"0A", "`":"4A", "í":"C7", "Ì":"E6", "ì":"C6","\n":"2720", "\r":"2720", "ë":"C1"]




func encrypt(inputString:NSString) -> NSString {
    
    var resultString = ""
    
    for (var i = 0; i < inputString.length; i++) {
        
        let charString = inputString.substringWithRange(NSRange.init(location: i, length: 1))
        
        let char = encryptionDictionary.objectForKey(charString) as! String
        
//        print ("\(char)")
        
        resultString.appendContentsOf(char)
    }
    
    
    return resultString
}

func decrypt(inputString:NSString) -> NSString {
    
    var resultString = ""
    
//    let decryptionDictionary = NSDictionary(objects: encryptionDictionary.allKeys, forKeys: encryptionDictionary.allValues)
    
    for (var i = 0; i < inputString.length; i+=2) {
        
        let charString = inputString.substringWithRange(NSRange.init(location: i, length: 2))
        
        let keys = encryptionDictionary.allKeysForObject(charString)
        
        var char:String
        
        if keys.count > 0 {
            char = keys[0] as! String
            
//            resultString.appendContentsOf(char)
            
            
        }
        
        else {
            char = charString
            
            print("\(charString)")
        }
        
        resultString.appendContentsOf(char)
        
        
//        print("\(charString) \(char)")
        
    }
    
    
    
    
    return resultString
}


func printTogether(string1:NSString, string2:NSString) {
    
    print("String 1 length = \(string1.length)")
    print("String 2 length = \(string2.length)")
    
    for (var i = 0; i < string1.length; i+=2) {
        
        let charString1 = string1.substringWithRange(NSRange.init(location: i, length: 2)) as NSString
        let charString2 = string2.substringWithRange(NSRange.init(location: i, length: 2)) as NSString
        
        print("\(charString1) \(charString2) * \(charString1.isEqualToString(charString2 as String))")
    }
    
}

func isPerfectMatch (string1:NSString, string2:NSString) -> Bool {
    
    var isPerfectMatch = true
    
    for (var i = 0; i < string1.length; i+=2) {
        
        let charString1 = string1.substringWithRange(NSRange.init(location: i, length: 2)) as NSString
        let charString2 = string2.substringWithRange(NSRange.init(location: i, length: 2)) as NSString
        
        if (!charString1.isEqualToString(charString2 as String)) {
            isPerfectMatch = false
        }
    }
    
    return isPerfectMatch
}

let poemString = "A Elbereth Gilthoniel\nsilivren penna míriel\no menel aglar elenath!\nNa-chaered palan-díriel\no galadhremmin ennorath,\nFanuilos, le linnathon\nnef aear, sí nef aearon!"

print(encrypt(poemString))


//print(encrypt("Gilthoniel"))

//print (encrypt("abc"))
//print(decrypt("6B0A6F46484F584F5E420A6D43465E42454443C1462720594346435C584F440A5A4F44444B0A47C75843C1462720450A474F444F460A4B4D464B580A4F464F444B5E420B2720644B0749424B4F584F4E0A5A4B464B44074EC75843C1462720450A4D4B464B4E42584F474743440A4F444445584B5E420627206C4B445F43464559060A464F0A464344444B5E4245442720444F4C0A4B4F4B58060A59C70A444F4C0A4B4F4B5845440B"))
//
//
printTogether("6B0A6F46484F584F5E420A6D43465E42454443C1462720594346435C584F440A5A4F44444B0A47C75843C1462720450A474F444F460A4B4D464B580A4F464F444B5E420B2720644B0749424B4F584F4E0A5A4B464B44074EC75843C1462720450A4D4B464B4E42584F474743440A4F444445584B5E420627206C4B445F43464559060A464F0A464344444B5E4245442720444F4C0A4B4F4B58060A59C70A444F4C0A4B4F4B5845440B", string2: "6B0A6F46484F584F5E420A6D43465E42454443C1462720594346435C584F440A5A4F44444B0A47C75843C1462720450A474F444F460A4B4D464B580A4F464F444B5E420B2720644B0749424B4F584F4E0A5A4B464B44074EC758434F462720450A4D4B464B4E42584F474743440A4F444445584B5E420627206C4B445F43464559060A464F0A464344444B5E4245442720444F4C0A4B4F4B58060A59C70A444F4C0A4B4F4B5845440B")



//printTogether(encrypt("A Elbereth Gilthoniel\nsilivren penna míriel"), string2: "6B0A6F46484F584F5E420A6D43465E42454443C1462720594346435C584F440A5A4F44444B0A47C75843C146")

//print(decrypt("C1"))

//print(isPerfectMatch(encrypt("A Elbereth Gilthoniel\nsilivren penna míriel"), string2: "6B0A6F46484F584F5E420A6D43465E424544434F46a720594346435C584F440A5A4F44444B0A47C758434F46"))
