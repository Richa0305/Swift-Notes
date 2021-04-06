# Core Data 

## Core data & concurrency

Managed Object Contaxts cannot be used from multiple threads.
Managed Object Contaxt cannot be passed between threads, we need to refetch them on each thread using the ManagedobjectID of the object you are trying to retrive. 

### Types of concurrency for managed object contexts 

#### NSMainQueueConcurrencyType
#### NSPrivateQueueConcurrencyType 

By default we will always have one managed object contaxt in main thread.And that will have the NSMainQueueConcurrencyType.

To perfom core-data operations on background thread, for each of them we can create managed object - child context with NSPrivateQueueConcurrencyType.


<img width="989" alt="Screenshot 2021-04-07 at 1 03 25 AM" src="https://user-images.githubusercontent.com/10761678/113768233-3c930780-973d-11eb-824c-1ed8dd62e6ca.png">


## Child & Parent Context - 

We need to save changes to child context and then save it to main context as well to actually persist.

<img width="336" alt="Screenshot 2021-04-07 at 1 07 22 AM" src="https://user-images.githubusercontent.com/10761678/113768593-a3b0bc00-973d-11eb-865d-d257956e91c8.png">


#### Two main reasons use cases for child context -

Threading - Work with core data with background thread by using a private queue child context 
Temporary changes - Allows user to discard changes by keeping modifications in child context.


## Migration - 

We can click on object model file and create new version for migration. 
