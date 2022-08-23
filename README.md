# SnipMaker

It's a script for your mac, which can top up the collection of snippets stored right here

---

## Features

- [x] Easy to customise output structure
- [x] High loyalty to input data
- [x] Running by

---

## Input data

Now it's a .tcbundle file with such json content


```javascript "description" : "Core snippets for service layer and services in general. Here you can find snippets for protocol \/ classes declarations, DAO instances declarations, service instance declarations and etc.",
  "supported_languages" : [
     "any"
   ],
   "expanders" : [
     {
       "output_template" : "\/\/\/ `${name.ucfirst}Service` instance\n\/\/\/\n\/\/\/ It is a bunch of methods that works with `${name.ucfirst}PlainObject` structure.\n\/\/\/ Basically, services contains primitive CRUD actions or atomic business actions.\n\/\/\/ Every service must return only `AnyPublisher` type from any method or `ServiceCall` type\n\/\/\/ that fully compatible with `Combine` and `AnyPublisher`\n\/\/\/ \n\/\/\/ Services are classes or components that encapsulate the logic required to access data sources.\n\/\/\/ They centralize common data access functionality, providing better maintainability and decoupling\n\/\/\/ the infrastructure or technology used to access necessary data layer.\n\/\/\/\n\/\/\/ Almost always standard services include DAO and this lets you focus on the data persistence logic\n\/\/\/ rather than on data access plumbing\n\/\/\/\n\/\/\/ - seealso: `${name.ucfirst}PlainObject` structure\n\/\/\/ - seealso: `${name.ucfirst}ServiceImplementation` class
protocol ${name.ucfirst}Service {

}",
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

## Collection:# INCETRO – Services

Core snippets for service layer and services in general. Here you can find snippets for protocol / classes declarations, DAO instances declarations, service instance declarations and etc.

------

### Service protocol
Syntax:
```swift
service_protocol ${name:identifier}
```
Input example:
```swift
service_protocol ${name:identifier}
```
Output:
```swift
/// `TestService` instance
///
/// It is a bunch of methods that works with `TestPlainObject` structure.
/// Basically, services contains primitive CRUD actions or atomic business actions.
/// Every service must return only `AnyPublisher` type from any method or `ServiceCall` type
/// that fully compatible with `Combine` and `AnyPublisher`
/// 
/// Services are classes or components that encapsulate the logic required to access data sources.
/// They centralize common data access functionality, providing better maintainability and decoupling
/// the infrastructure or technology used to access necessary data layer.
///
/// Almost always standard services include DAO and this lets you focus on the data persistence logic
/// rather than on data access plumbing
///
/// - seealso: `TestPlainObject` structure
/// - seealso: `TestServiceImplementation` class
protocol TestService {

}
```

------

### Service implementation
Syntax:
```swift
service_impl ${name:identifier}
```
Input example:
```swift
service_impl ${name:identifier}
```
Output:
```swift
// MARK: - TestServiceImplementation

/// `TestServiceImplementation` instance
///
/// It is a bunch of methods that works with `TestPlainObject` structure.
/// Basically, services contains primitive CRUD actions or atomic business actions.
/// Every service must return only `AnyPublisher` type from any method or `ServiceCall` type
/// that fully compatible with `Combine` and `AnyPublisher`
/// 
/// Services are classes or components that encapsulate the logic required to access data sources.
/// They centralize common data access functionality, providing better maintainability and decoupling
/// the infrastructure or technology used to access necessary data layer.
///
/// Almost always standard services include DAO and this lets you focus on the data persistence logic
/// rather than on data access plumbing
///
/// - seealso: `TestPlainObject` structure
/// - seealso: `TestService` protocol
public final class TestServiceImplementation {

}

// MARK: – TestService

extension TestServiceImplementation: TestService {

}
```

------

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
protocol TestService {

}
```

------

### Download service implementation
Syntax:
```swift
downl_serv_impl
```
Input example:
```swift
downl_serv_impl
```
Output:
```swift
/// `DownloadServiceImplementation` instance
///
/// It is a bunch of methods that implements data loading.
/// Basically, `DownloadServiceImplementation` provides all necessary methods to load some `Data` from the given `URL`.
/// As an every service, `DownloadServiceImplementation` must return only `AnyPublisher` type from any method.
///
/// Services are classes or components that encapsulate the logic required to access data sources.
/// They centralize common data access functionality, providing better maintainability and decoupling
/// the infrastructure or technology used to access necessary data layer.
///
/// - seealso: `DownloadService` protocol
```

------

### DAO alias
Syntax:
```swift
dao_alias ${name:identifier}
```
Input example:
```swift
dao_alias ${name:identifier}
```
Output:
```swift
/// [DAO](https://www.oracle.com/java/technologies/dataaccessobject.html) alias for `testPlainObject`
public typealias testDAO = DAO<RealmStorage<testModelObject>, testTranslator>
```

------

### DAO property
Syntax:
```swift
dao ${name:identifier}
```
Input example:
```swift
dao ${name:identifier}
```
Output:
```swift
/// `testDAO` instance
///
/// The DAO implements the access mechanism required to work with the data source.
/// The data source could be a persistent store like an RDBMS, an external service like a B2B exchange,
/// a repository like an LDAP database, a business service or low-level sockets.
///
/// The business component that relies on the DAO uses the simpler interface exposed by the DAO for its clients.
/// The DAO completely hides the data source implementation details from its clients.
/// Because the interface exposed by the DAO to clients does not change when the underlying data source implementation changes,
/// this pattern allows the DAO to adapt to different storage schemes without affecting its clients or business components.
///
/// Essentially, the DAO acts as an adapter between the component and the data source.
private let dao: testDAO

```
