import 'package:count_provider/provider/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  // double value = 1.0;

  Widget build(BuildContext context) {
    // final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ExampleOneProvider>(
              builder: (builder, valueP, child) {
                return Slider(
                  min: 0,
                  max: 1,
                  value: valueP!.value,
                  onChanged: (val) {
                    print(valueP.toString());
                    // value = val;
                    valueP.setSlider(val);
                    // setState(() {});
                  },
                );
              },
            ),
            // Slider(
            //   min: 0,
            //   max: 1,
            //   value: provider.value,
            //   onChanged: (val) {
            //     print(value.toString());
            //     value = val;
            //     provider.setSlider(val);
            //     // setState(() {});
            //   },
            // ),

            Consumer<ExampleOneProvider>(builder: (builder, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: Center(child: Text('Container 2')),
                    ),
                  ),
                ],
              );
            })
            // Row(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         height: 150,
            //         decoration: BoxDecoration(
            //           color: Colors.green.withOpacity(value),
            //         ),
            //         child: Center(child: Text('Container 1')),
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         height: 150,
            //         decoration: BoxDecoration(
            //           color: Colors.red.withOpacity(value),
            //         ),
            //         child: Center(child: Text('Container 2')),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
