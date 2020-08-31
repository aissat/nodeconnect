Nodeconnect dart package


```yaml
  nodeconnect: 1.0.0

```

`main.dart`

```dart

import 'nodeconnect/lib/nodeconnect.dart';

main() {

var nc = Nodeconnect();
  if(nc.connect() == nullptr)
    print("Failed to allocate vpninfo structure\n");

}



```