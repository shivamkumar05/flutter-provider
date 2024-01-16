import 'package:flutter/material.dart';

class NotifyScreen extends StatelessWidget {
  NotifyScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: toogle,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: toogle.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffix: InkWell(
                          onTap: () {
                            toogle.value = !toogle.value;
                          },
                          child: Icon(toogle.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                    ),
                  );
                }),
            Center(
              child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    _counter.value.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.value++;
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}



//doing work of stateful widget with stateless widget porns: performance increases cons: dispose and init functionality not available 