# INCETRO – Services

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
/// `MaksService` instance
///
/// It is a bunch of methods that works with `MaksPlainObject` structure.
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
/// - seealso: `MaksPlainObject` structure
/// - seealso: `MaksServiceImplementation` class
protocol MaksService {

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
// MARK: - MaksServiceImplementation

/// `MaksServiceImplementation` instance
///
/// It is a bunch of methods that works with `MaksPlainObject` structure.
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
/// - seealso: `MaksPlainObject` structure
/// - seealso: `MaksService` protocol
public final class MaksServiceImplementation {

}

// MARK: – MaksService

extension MaksServiceImplementation: MaksService {

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
protocol MaksService {

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
/// [DAO](https://www.oracle.com/java/technologies/dataaccessobject.html) alias for `maksPlainObject`
public typealias maksDAO = DAO<RealmStorage<maksModelObject>, maksTranslator>
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
/// `maksDAO` instance
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
private let dao: maksDAO

```
