# Design documentation

The **GildeRose#update_quality** is more than just a simple setter method. It needs to employ different calculation method to calculate the new quality value based on particular item name. The original solution is taking a quite procedural approach to solve it.

The readability and maintainability of the code can be improved by taking a polymorphism approach to solve it. The `#update_quality` will still be responsible in mutating the state of the item, however the calculation can be delegated to a calculation module.

The calculation module is open to accept new calculator in a configuration manner. However, the new calculator has to be implemented before hand.

## Class diagram

```puml
!define MODULE (M,#AAAAAA)

class GildedRose {
    + update_quality
}
class Calculable << MODULE >> {
    * calculator dispatcher
    * place to configure new calculator 
    --
    + calculate_quality
}
class QualityCalculators << singleton >> {
    * keeper of all the calculators
    --
    + get_calculator
    + register
}

GildedRose -.-right> Calculable

QualityCalculators o-u-> QualityCalculator : has many >
QualityCalculator -u-|> Calculable

namespace QualityCalculator {
  abstract class Base {
    + run
  }
  class Degradable
  class DoubleDegradable
  class Increaseable
  class Legendary
  class SteppedIncreaseable

  Degradable -up-|> Base : extends
  DoubleDegradable -up-|> Base : extends
  Increaseable -up-|> Base : extends
  Legendary -up-|> Base : extends
  SteppedIncreaseable -up-|> Base : extends
}
```
![class-diagram](http://www.plantuml.com/plantuml/png/TL5jIyCm4FwUNt7Y5z_g3nYZe9k8i24gVXwtvDO6iwGcAJgq_ztqPLrhsq2XkUVbdhkS2Tf9JR1-Nhwl7k1YVND-LvrBnhX2v-1HAa7YrJY27mRXN4EU2VIq-SnHINzWHSDSeEAvmgqYcC-FZd7SoAw0rxWt5eHq6NgUacsmJ24dy0QuqJkPv9P0qrTNKX6Zg8bm18OfNkhxebMwCesJEb7aZUu6-Y3Ao8BP0Ie5FgLEFzVlbv3VdC2cQ2cHpeSP2iOwQufk8okJrCUTZJ0saij4UHGF0yCCKdImHts0UAY3eFhjUslSKrXesE2GNGwBM-SjSW_rYkwnyvWsr-6l25yDBYcnA2hVjcJoS1q1dZIt5CnwnHKbf0NQGrjvyvHb97hi09uCmqXPELCLR0RqxOD3-GB_EqyIkzwJf3RP96CawGIt-0C0
)