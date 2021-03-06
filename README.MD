# Design Patterns

> Любой паттерн описывает задачу, которая снова и снова возникает в нашей работе, а также принцип ее решения, причем таким образом, что это решение можно потом использовать миллион раз, ничего не изобретая заново.

# Оглавление

* [Главное](#Главное)
1. [Порождающие паттерны](#1.-порождающие-паттерны)  
    * [Singleton](#Singleton)
    * [Factory Method](#factory-method)

# Главное
>  Под паттернами проектирования понимается описание взаимодействия объектов и классов, адаптированных для решения общей задачи проектирования в конкретном контексте.

Принято классифицировать паттерны по двум критериям.  
1.  **Цель** - отражает назначение паттерна.
* *Порождающие* - отвечают за создание объектов.  
* *Структурные* - отвечают за композицию объектов и классов
* *Поведенческие* - отвечают за взаимодействие объектов
2. **Уровень** - говорит о том, к чему обычно применяется паттерн: *к объектам или классам*. 
* Паттерны **уровня классов** *описывают отношения между классами и их подклассами.* 
Такие отношения выражаются с помощью наследования, поэтому они статичны, то есть зафиксированы на этапе компиляции. 
* Паттерны **уровня объектов** *описывают отношения между объектами, которые могут изменяться во время выполнения и потому более динамичны.*  


Почти все паттерны в какой-то мере используют наследование. Поэтому к категории «паттерны классов» отнесены только те, что сфокусированы лишь на отношениях между классами.  

![ ](https://raw.githubusercontent.com/nastyouth/design-patterns/master/img/tableOne.png)

Обратите внимание: большинство паттернов действуют на уровне объектов.

* **Порождающие паттерны классов** частично делегируют ответственность за создание объектов своим подклассам, тогда как **порождающие паттерны объектов** передают ответственность другому объекту.   
* **Структурные паттерны классов** используют наследование для составления классов, в то время как **структурные паттерны объектов** описывают способы сборки объектов из частей.  
* **Поведенческие паттерны классов** используют наследование для описания алгоритмов и потока управления, а **поведенческие паттерны объектов** описывают, как объекты, принадлежащие некоторой группе, совместно функционируют и выполняют задачу, которая ни одному отдельному объекту не под силу.


# 1. Порождающие паттерны
> **Порождающие паттерны проектирования** абстрагируют процесс инстанцирования. Они помогут сделать систему независимой от способа создания, композиции и представления объектов. Паттерн, порождающий классы, использует наследование, чтобы варьировать инстанцируемый класс, а паттерн, порождающий объекты, делегирует инстанцирование другому объекту.

Эти паттерны оказываются важны, когда система больше зависит от композиции объектов, чем от наследования классов.
Основной упор делается на определении небольшого набора фундаментальных поведений, с помощью композиции которых можно получать любое число более сложных.

Во-первых, эти паттерны инкапсулируют знания о конкретных классах, которые применяются в системе. Во-вторых, скрывают детали того, как эти классы создаются и стыкуются. Единственная информация об объектах, известная системе, - это их протоколы. Следовательно, порождающие паттерны обеспечивают большую гибкость при решении вопроса о том, что создается, кто это создает, как и когда. Можно собрать систему из «готовых» объектов с самой различной структурой и функциональностью статически (на этапе компиляции) или динамически (во время выполнения).

# Singleton

**Одиночка** - порождающий шаблон проектирования, гарантирующий, что в приложении будет единственный экземпляр некоторого класса, и предоставляющий глобальную точку доступа к этому экземпляру

Плюсы:
- контролируемый доступ к единственному экземпляру  

Минусы:
- глобальные объекты могут быть вредны для ООП, в некоторых случаях приводят к созданию немасшабируемого проекта
- усложняет написание тестов и следование TDD.  

> **Основная задача синглтона** - предоставить пользователю один и только один объект определенного класса на весь жизненный цикл приложения.

Объект какого-либо класса можно создать бесконечное количество раз при помощи MyClass(), поэтому необходимо запрететить создание объекта нашего класса извне.

```swift
class MyClass {
    private init() {} 
} 
```

Мы получили класс, объекты которого не могут создаваться, потому что конструктор — **приватный**.  

Создадим объект нашего класса внутри нашего же класса. И будем использовать для этого статический метод. Так же  **отметим класс, как конечный (final)**, чтобы предотвратить унаследование или переопредление.

```swift
final class Singleton {

    static let shared = Singleton()

    private init() {}
}
```

Что касается **потокобезопасности**, в Swift не нужно выполнять какие-либо дополнительные действия. Константа **shared** уже потокобезопасна, т.к. значение в нее может быть записано один раз, и сделает это тот поток, который доберется до нее первым.

----

**TDD (Test Driven Development)** — это методология разработки ПО, которая основывается на повторении коротких циклов разработки: изначально пишется тест, покрывающий желаемое изменение, затем пишется программный код, который реализует желаемое поведение системы и позволит пройти написанный тест. Затем проводится рефакторинг написанного кода с постоянной проверкой прохождения тестов.

> TDD считается одной из форм правильного метода построения приложения. Философия разработки на основе тестов заключается в том, что ваши тесты являются спецификацией того, как ваша программа должна вести себя. 

----
## Factory Method

**Фабричный метод** — это порождающий паттерн проектирования, который определяет общий интерфейс для создания объектов в суперклассе, позволяя подклассам изменять тип создаваемых объектов.

Фабричный метод определяет протокол для создания объектов, при этом выбранный класс инстанцируется подклассами.

> Книга «Банды четырех» сообщает, что шаблон также известен под названием «виртуальный конструктор», и это не зря. В «C++» виртуальной называется функция, переопределяемая в производных классах. Возможности объявить виртуальным конструктор язык не дает, и не исключено, что именно попытка сымитировать нужное поведение привела к изобретению данного паттерна.

**Применимость**  
Используйте паттерн фабричный метод, когда:
* классу заранее неизвестно, объекты каких классов ему нужно создавать;
* класс спроектирован так, чтобы объекты, которые он создает, специфици-
ровались подклассами;
* класс делегирует свои обязанности одному из нескольких вспомогательных
подклассов, и вы планируете локализовать знание о том, какой класс при- нимает эти обязанности на себя.

Плюсы:  
* Избавляет класс от привязки к конкретным классам продуктов.
* Выделяет код производства продуктов в одно место, упрощая поддержку кода.
* Упрощает добавление новых продуктов в программу.
* Реализует принцип открытости/закрытости.  

Минусы:
* Может привести к созданию больших параллельных иерархий классов, так как для каждого класса продукта надо создать свой подкласс создателя.

*Но от этой проблемы можно легко уйти. [В примере кода](https://github.com/nastyouth/design-patterns/Factory "") это продемонстрировано. Вместо ConcreteCreatorA и ConcreteCreatorB мы создадим один класс.*

```swift
protocol Product {
    func getName() -> String
}

class ConcreteProductA: Product {
    func getName() -> String { return "ConcreteProductA" }
}

class ConcreteProductB: Product {
    func getName() -> String { return "ConcreteProductB" }
}

protocol Creator {
    func factoryMethod() -> Product
}

class ConcreteCreatorA: Creator {
    func factoryMethod() -> Product { return ConcreteProductA() }
}

class ConcreteCreatorB: Creator {
    func factoryMethod() -> Product { return ConcreteProductB() }
}

```

**Структура:**  
- **Product** - продукт:  
 определяет протокол объектов, создаваемых фабричным методом
- **ConcreteProduct** - конкретный продукт:  
 реализует протокол Product
- **Creator** - создатель  
 объявляет фабричный метод, который возвращает объект типа Product. Может также определять реализацию по умолчанию фабрич
ного метода, который возвращает объект ConcreteProduct
- **ConcreteCreator** - конкретный создатель:  
 переопределяет фабричный метод таким образом, чтобы он создавал и возвращал объект типа ConcreteProduct

**Результат:**  
Фабричные методы избавляют проектировщика от необходимости встраивать в код зависящие от приложения классы. Код имеет дело только с протоколом Product, поэтому он может работать с любыми определенными пользователями классами конкретных продуктов.
