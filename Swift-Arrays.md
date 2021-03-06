# Swift Array 

Arrays hold elements of one single type. The array’s element type can be of type string, integer, all the way to a class.

 1. empty array initialization
```
	let numbers = [Int]()
	
	let nums: [Int] = []

	let newNumbers = Array<Int>()

	let newNums: Array<Int> = Array()
	
```

2.  Preinitializing a fixed number of default values
```	
	let repeatSwift = Array<String>(repeating: "Swift", count: 5)
		// ["Swift", "Swift", "Swift", "Swift", "Swift"]

	let repeatSwift = Array(repeating: "Swift", count: 5)
		// ["Swift", "Swift", "Swift", "Swift", "Swift"]
```
3. Array literals 
```
	let flowers = ["Lily", "Rose", "Daisy", "Scarlet", "Tulip"]
		// ["Lily", "Rose", "Daisy", "Scarlet", "Tulip"]

```

### How it works - 

If you create an array with four items, Swift will allocate enough capacity for that array to hold only those four items. So, both yourArray.count and yourArray.capacity will be equal to 4.

Count determines how many elements there are in the array.

Capacity determines the total amount of elements the array can contain before exceeding and having to allocate new memory.

Now let’s say you want to append a fifth item. The array doesn’t have capacity for that, so it needs to make some space – it will find memory to hold more items, copy the array there, then append the fifth item. This has an O(n) run time, where n is the number of items in the array.


To avoid constant reallocations, Swift uses a geometric growth pattern for array capacities – a fancy way of saying that it increases array capacity exponentially rather than in fixed amounts. So, when you add a fifth item to an array with capacity 4, Swift will create the resized array so that it has a capacity of 8. And when you exceed that you’ll get a capacity of 16, then 32, then 64, and so on – it doubles each time.

#### Can we reduce reallocation?
Yes! This is where the reserveCapacity(_:) method comes in handy. If you know roughly how many total items will be contained in the array, you can declare the capacity size with the reserveCapacity(_:) method right when you initialize the array. One thing to keep in mind is that it doesn’t mean there can only be that many amount of items in the array; items can still be appended that exceeds the reserved capacity size, but that will trigger reallocation.

reserveCapacity() also has an O(n) run time based on the number of elements in the array, so you should definitely call it when the array is still empty.
```
var randomNumbers = [Int]()
randomNumbers.reserveCapacity(512)

for _ in 1...512 {
    randomNumbers.append(Int.random(in: 1...10))
}

```
### Swift Operations - 


##### Adding an Item in Array - 
* append(_:) Adds a single item to the end of the array. // O(1)
* append(contentsOf: ) Adds multiple elements in the given parameter to the end of the array. // O(m) on average, where m is the length of newElements
* insert(_:at:) Inserts an item at the given index. //Complexity: O(n)
* insert(contentsOf:at:) Inserts multiple elements at the given index. // O(n + m), where n is length of this collection and m is the length of newElements.


Time Complexity : O(1)
There’s only one case where runtime is O(n)—when allocating new memory, since you have to copy over all items to the new storage.

But this is very rare as the array gets bigger! Think about it. The array doubles in size every time reallocation is triggered, which makes it take much longer for the array to fill to capacity. Therefore, these changes cancel each other out, leaving an average runtime of O(1) for each append call.

##### Removing an Item from an Array - 
* remove(at:) Removes and returns item at given index in the array. Complexity: O(n)
* removeFirst() Removes and returns first item in the array. Complexity: O(n)
* removeLast() Removes and returns last item in the array. Complexity: O(1)
* removeAll(), removeAll(keepingCapacity:) Removes all items in the array and reduces capacity to 0 unless declared to keep capacity with true. Complexity: O(n)
* removeSubrange(_:) Removes all elements within the range and shifts elements after that to fill its positions. Complexity: O(n)
* popLast() Removes and returns last item in the array. Complexity: O(1)


insert(_:at:). Inserts a new element at the specified position.
Complexity: O(n), where n is the length of the array.

contains(_:) :Returns a Boolean value indicating whether the sequence contains the given element. Complexity: O(n)

subscript(_:) :Accesses the element at the specified position.Complexity: O(1)
