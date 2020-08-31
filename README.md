Nodeconnect dart package


```yaml
  nodeconnect:
    git: git@gitlab.com:nodevpn1/nodecoonec-dart-pkg.git
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
