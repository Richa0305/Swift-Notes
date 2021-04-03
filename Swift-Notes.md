
#  Swift Collection



##  Array
An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.

```
Ex - var someInts = [Int]()
someInts.append(3)

var threeDoubles = Array(repeating: 0.0, count: 3)

var shoppingList = ["Eggs", "Milk"]
```


##  Set 
A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.

Hash Values for Set Types
A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally, such that if a == b, it follows that a.hashValue == b.hashValue.

All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values (as described in Enumerations) are also hashable by default.

```
var letters = Set<Character>()

letters.insert("a")

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]


for genre in favoriteGenres {
    print("\(genre)")
}
```

#### Set Operations - 

<img width="595" alt="Screenshot 2021-04-03 at 9 41 00 PM" src="https://user-images.githubusercontent.com/10761678/113484322-57f3dd80-94c5-11eb-9bcf-7f0a47d553f3.png">


```
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
```
#### Set Membership and Equality

-   Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
-   Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
-   Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
-   Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
-   Use the isDisjoint(with:) method to determine whether two sets have no values in common.


```
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
```

## Dictionary 
A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary do not have a specified order. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.
```
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."
```

#### Iterating Over a Dictionary
```
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson


for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson
```
