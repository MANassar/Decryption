//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



let encryptionDictionary:NSDictionary = ["a":"sg==", "b":"sw==", "c":"tA=="]//, "d":"4E", "e":"4F", "f":"4C","g":"4D","h":"42",	"i":"43",	"j":"40",	"k":"41",	"l":"46",	"m":"47",	"n":"44",	"o":"45",	"p":"5A","q":"5B","r":"58",	"s":"59",	"t":"5E",	"u":"5F",	"v":"5C",	"w":"5D",	"x":"52",	"y":"53",	"z":"50",
    
//    "A":"6B", "B":"68", "C":"69", "D":"6E", "E":"6F", "F":"6C","G":"6D","H":"62",	"I":"63",	"J":"60",	"K":"61",	"L":"66",	"M":"67",	"N":"64",	"O":"65",	"P":"7A","Q":"7B","R":"78",	"S":"79",	"T":"7E",	"U":"7F",	"V":"7C",	"W":"7D",	"X":"72",	"Y":"73",	"Z":"70",

//    "1":"1B","2":"18","3":"19","4":"1E", "5":"1F","6":"1C","7":"1D","8":"12","9":"13","0":"1A", "~":"54","!":"0B","@":"6A","#":"09","$":"0E","%":"0F","^":"74","&":"0C","*":"00","(":"02",")":"03","-":"07","+":"01","=":"17","_":"75", ",":"06", "<":"16",">":"14", "?":"15", "{":"51","}":"57","[":"71","]":"77","\\":"76","|":"56","\"":"08", "'":"0D", " ":"0A", "`":"4A", "í":"C7", "Ì":"E6", "ì":"C6","\n":"2720", "\r":"2720", "ë":"C1"]

let indexTable = [

/*func generateIndexTable() -> Dictionary<String,String> {
    
    //First generate char array
    
    var charArray = [String]()
    var k = 0
    
    for i in 0...26 {
        let char:Character = "\u{97}"
         charArray[i] = String(char)
        k++
    }
    
    var indexTable = [String:String]()
    
    for i in 0...63 {
        
        indexTable[String(i)] = "A"
        
    }
    
    return indexTable
}
*/

func pad(string : NSMutableString, toSize: Int, padFromLeft:Bool) -> NSMutableString {
    let padded = string
    for _ in 0..<toSize - string.length {
        
        if(!padFromLeft) {
            padded.appendString("0")
        }
        
        else {
            padded.insertString("0", atIndex:0)
        }
        
    }
    return padded
}



func convertCharToPaddedByte (characterToConvert characterToConvert:NSString) -> NSString {
    
    let value = characterToConvert.UTF8String.memory

    let binaryValue = String(value, radix: 2)
    
    let str = pad(NSMutableString.init(string: binaryValue), toSize: 8, padFromLeft:true)
    
    print ("Char to padded byte = \(str)")
    
    return str
    
}

func encodeString(inputString input:NSString) -> NSString{
    
    var bitString = NSMutableString()
    var resultDecimalString = NSMutableString()
    
    //First get the entire bit string
    for (var i = 0; i < input.length; i++) {
        
        print(String(input.characterAtIndex(i)))
        
        let charValue = convertCharToPaddedByte(characterToConvert: String(input.substringWithRange(NSRange.init(location: i, length: 1))))
        
        bitString.appendString(charValue as String)
    }
    
    // Take 6 bits at a time
    
    for (var i = 0; i < bitString.length; i=i+6) {
        
//        print(i)
        
        if (bitString.length % 6 != 0) {
            
            let newLength = bitString.length + (6 - bitString.length%6 )
            
            print ("Old length = \(bitString.length) \nNew length = \(newLength)")
            
            bitString = pad(bitString, toSize: newLength, padFromLeft:false)
            
        }
        
        let bitSubstring = bitString.substringWithRange(NSRange.init(location: i, length: 6))
        
        print (bitSubstring)
        
        //Convert to decimal again
        
        let decimalSubstring = String(strtoul(bitSubstring, nil, 2))
        
        print("Decimal substring = \(decimalSubstring)")
        
        resultDecimalString.appendString(decimalSubstring)
    }
    
    
    
    return resultDecimalString
    
}

//print(convertCharToPaddedByte(characterToConvert: "a"))

//convertCharToPaddedByte(characterToConvert: "a")
//
encodeString(inputString: "M")

generateIndexTable()
