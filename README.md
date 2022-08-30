# SnipMaker

It's a script for your mac, which can top up the collection of snippets stored right here

---

## Features

- [x] Easy to customise output structure
- [x] High loyalty to input data
- [x] Running by .command file

---

## Input data

Now it's a .tcbundle file with such json content


```json "description" : "Core snippets for service layer and services in general. Here you can find snippets for protocol \/ classes declarations, DAO instances declarations, service instance declarations and etc.",
  "supported_languages" : [
     "any"
   ],
   "expanders" : [
     {
       "output_template" : "\/\/\/ `${name.ucfirst}Service` instance\n\/\/\/\n\/\/\/ It is a bunch of methods that works with `${name.ucfirst}PlainObject` structure.\n\/\/\/ Basically, services contains primitive CRUD actions or atomic business actions.\n\/\/\/ Every service must return only `AnyPublisher` type from any method or `ServiceCall` type\n\/\/\/ that fully compatible with `Combine` and `AnyPublisher`\n\/\/\/ \n\/\/\/ Services are classes or components that encapsulate the logic required to access data sources.\n\/\/\/ They centralize common data access functionality, providing better maintainability and decoupling\n\/\/\/ the infrastructure or technology used to access necessary data layer.\n\/\/\/\n\/\/\/ Almost always standard services include DAO and this lets you focus on the data persistence logic\n\/\/\/ rather than on data access plumbing\n\/\/\/\n\/\/\/ - seealso: `${name.ucfirst}PlainObject` structure\n\/\/\/ - seealso: `${name.ucfirst}ServiceImplementation` class protocol ${name.ucfirst}Service {}",
      "is_enabled" : true,
       "name" : "Service protocol",
       "supported_languages" : [
         "any"
       ],
       "description" : "",
       "identifier" : "",
       "pattern" : "service_protocol ${name:identifier}"
     }
   ],
   "is_enabled" : true,
   "name" : "INCETRO – Services"
 }
```

---

## How customise structre?

 - Cases in this enum responsible for connection between input data and output structure. Raw value - field name in input data
 - Enum also has fields:
    - nestingLevel - it helps to set nesting level of container in input data.
    - value - it returns raw value without spaces " ". These spaces need for repeating raw values in cases.
    - mayRepeat - it indicates if field in output file can repeat. (Headers - no, snippet's fields - yes)
 - And one function 'output' - directly responsible for how snippets will look like.

**Enum:**

<details>

```swift

// MARK: - MDFrameImplementation

enum MDFrameImplementation: String, MDFrame, CaseIterable {
    
    // MARK: - Cases
    
    case headerField = "name"
    case descriptionField = "description"
    case nameField = "name "
    case syntaxField = "pattern"
    case inputField = "pattern "
    case outputField = "output_template"
    
    func output(_ element: Any) -> String {
        switch self {
        case .headerField:
            return """
            # \(element)
            
            """
        case .descriptionField:
            return """
            
            \(element)
            
            """
        case .nameField:
            return """
            
            ------
            
            ### \(element)
            
            """
        case .syntaxField:
            return """
            Syntax:
            ```swift
            \(element)
            ```
            
            """
        case .inputField:
            return """
            Input example:
            ```swift
            \(element)
            ```
            
            """
        case .outputField:
            return """
            Output:
            ```swift
            \(element)
            ```
            
            """
        }
    }
    
    var nestingLevel: Int {
        switch self {
        case .headerField, .descriptionField:
            return 0
        default:
            return 1
        }
    }
    var value: String {
        return self.rawValue.filter{$0 != " "}
    }
    var mayRepeat: Bool {
        switch self {
        case .headerField, .descriptionField:
            return false
        default:
            return true
        }
    }
}
```
</details>

**Example snippet:**

<details>

### Download service protocol
Syntax:
```swift
downl_serv_protocol ${name:identifier}
```
Input example:
```swift
downl_serv_protocol ${name:identifier}
```
Output:
```swift
/// `DownloadService` instance
///
/// It is a bunch of methods that implements data loading.
/// Basically, `DownloadService` provides all necessary methods to load some `Data` from the given `URL`.
/// As an every service, `DownloadService` must return only `AnyPublisher` type from any method.
///
/// Services are classes or components that encapsulate the logic required to access data sources.
/// They centralize common data access functionality, providing better maintainability and decoupling
/// the infrastructure or technology used to access necessary data layer.
///
/// - seealso: `DownloadServiceImplementation` class
protocol SadasdService {

}
```

</details>

---

## How run the scirpt?

Just download this project and open the **run.command** file that stored in this project.

#### *About run file*:

This file has a  value which you need to update:

 - TakeDir - a path where input data strored

There are also has a git part, responsible for pushing new snippets to the collection.
I highly recommend to check it and set it for your own.

---

## Requriments
 - macOS 10.13+
 - Xcode 9.0
 - Swift 5

---

## Communication

 - If you found a bug, open an issue.
 - If you have a feature request, open an issue.
 - If you want to contribute, submit a pull request.

## Author

incetro, incetro@ya.ru

---
---
---

# Collection:
# INCETRO – Services

Core snippets for service layer and services in general. Here you can find snippets for protocol / classes declarations, DAO instances declarations, service instance declarations and etc.
