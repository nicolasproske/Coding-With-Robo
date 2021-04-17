//
//  Globals.swift
//  GlobalModule
//
//  Created by Nicolas Proske.
//

import SwiftUI

public extension Text {
    /**
     
     Applies the defined parameters to the text.
     
        - Note: The default value of `weight` is `.regular`.
     
        - parameters:
            - size: The size in *pt*
            - weight: The weight in `Font.Weight`
     
     */
    func defaultTextStyle(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        self
            .font(.system(size: size, weight: weight, design: .rounded))
    }
}

public extension CGFloat {
    /**
     
     Generates a random value between the values 0 and 255.
     
        - returns: A random value between 0 and 255 of the type `CGFloat`.
     
     */
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

public extension UIColor {
    /**
     
     Generates a random color.
     
        - requires: A static function `random()` that returns `CGFloat` between 0 and 255.
     
        - note: The default value of `alpha` is `1.0`.
     
        - parameter alpha: Alpha value of the color
     
        - returns: A random color of the type `UIColor`.
     
     */
    static func random(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: alpha)
    }
}

// Source from https://stackoverflow.com/questions/27259332/get-random-elements-from-array-in-swift
public extension Array where Element: Hashable {
    /**
     
     Get `n` random elements of array.
     
        - requires: Count of elements in given array greater than or equal to n; n greater than or equal to 0
     
        - parameter n: Count of the returned elements
     
        - returns: `n` random elements of array.
     
     */
    func pick(_ n: Int) -> [Element] {
        let set: Set<Element> = Set(self)

        guard (set.count >= n) && (n >= 0) else {
            fatalError("The array has to have at least \(n) unique values and the number of elements to be picked have to be greater than or equal to 0.")
        }

        return Array(set.prefix(upTo: set.index(set.startIndex, offsetBy: n)))
    }

    /**
     
     Append element to array.
     
        - parameter o: Element which should be appended
     
        - returns: Array with appended element
     
     */
    func appendElement(o: Element) -> [Element] {
        return self + [o]
    }
}
