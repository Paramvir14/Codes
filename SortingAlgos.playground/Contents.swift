import UIKit

var arrUnsorted = [34,11,8, 56, 46,1,47]

//SelectionSort
// Select minimum each turn and fix it in front, Thats it

func selectionSort(unsorted: [Int]) -> [Int] {
    var array = unsorted
   var temp = 0
  
    guard  array.count != 0 else {
        print("Empty Array")
        return unsorted
    }

    for i in 0..<array.count {
        print("Array after \(i) Round: \(array)")
        for j in i..<array.count {
            if array[i] > array[j] {
              print("\(array[j] ) is smaller tham \(array[i]), So it is getting swapped ")
                temp = array[i]
                array[i] = array[j]
                array[j] = temp
                
            }
        }
    }
    return array
    
}

//Bubble Sort
//The point is when We traverse array and swapping the bigger, U get Biggest in last place at the end of each cycle, So we have last sorted each turn.
func bubbleSort(unsorted: [Int]) -> [Int] {
    var array = unsorted
   var temp = 0
    var iterations = unsorted.count-1
    for i in 0..<unsorted.count-1 {
        print("Array after \(i) Round: \(array)")
        for j in 0..<iterations {
            if array[j] > array[j+1] {
                temp = array[j+1]
                array[j+1] = array[j]
                array[j] = temp
            }
        }
        iterations -= 1
    }
    
    return array
    
}

//Insertion Sort

func insertionSort(_ unsorted: [Int]) -> [Int] {
   var array = unsorted

    var j = 0
    var marker = 0
    
    for i in 1..<array.count {
        marker = array[i]
        j = i-1
        print("After Round \(i), Array is : \(array)")
        while j>=0 && array[j]>marker {
            array[j+1] = array[j]
            j = j-1
        }
        array[j+1] = marker
         
    }
    return array
}


print("Unsorted Array is: \(arrUnsorted)")
var sortedArray = insertionSort(arrUnsorted)
print("Array after sorting is: \(sortedArray)")
