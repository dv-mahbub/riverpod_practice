import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/stateful_widget/stateful_widget_provider.dart';
import 'package:riverpod_practice/stateful_widget/stateful_widget_single_variable_stateprovider.dart';
import 'package:riverpod_practice/stateful_widget/stateful_widget_stateprovider.dart';
import 'package:riverpod_practice/stateless_widget/stateless_widget_provider.dart';
import 'package:riverpod_practice/stateless_widget/stateless_widget_provider_using_consumer.dart';

final welcome = Provider<String>(
    (ref) {
      return 'Hello Word';
    }
);

final number = StateProvider<int>((ref) => 0);

void main(){
  runApp(const ProviderScope(child: MaterialApp(home: MyApp(),)));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Practice'),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //1. stateless widget - provider
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const StatelessWidgetRiverpod())),
              child: const Text('1. Stateless Widget - Provider'),
            ),
            const SizedBox(height: 20,),

            //2. stateless widget using consumer - provider
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const StatelessWidgetUsingConsumer())),
              child: const Text('2. Stateless Widget using Consumer - Provider'),
            ),
            const SizedBox(height: 20,),

            //3. stateful widget - provider
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const StatefulWidgetRiverpod())),
              child: const Text('3. Stateful Widget - Provider'),
            ),
            const SizedBox(height: 20,),

            //4. stateful widget - stateProvider
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const StatefulWidgetStateProvider())),
              child: const Text('4. Stateless Widget - StateProvider'),
            ),
            const SizedBox(height: 20,),

            //5. stateful widget using global single variable - stateProvider
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const StatefulWidgetSingleVariableStateProvider())),
              child: const Text('5. Stateless Widget Single Variable - StateProvider'),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}



//
// class MyApp extends ConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final message = ref.watch(welcome);
//     return Scaffold(
//       body: Center(
//         child: Text(message,),
//       ),
//     );
//   }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Consumer(
  //         builder: (context, ref, child){
  //           final message = ref.watch(welcome);
  //           return Text(message);
  //         },
  //       ),
  //     ),
  //   );
  // }
//}
//
//
// class MyApp extends ConsumerStatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends ConsumerState<MyApp> {
//   var message2 = '';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     message2 = ref.read(welcome);
//     print(message2);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    // final message = ref.watch(welcome);
//     return Scaffold(
//       body: Center(
//         child: Text(message2),
//       ),
//     );
//   }
// }
//
//
// class MyApp extends ConsumerStatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends ConsumerState<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//
//
//     var count = ref.watch(number);
//
//     //ref.listen(number, (previous, next) {if(next == 5){print('this is number $next');}});
//
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(count.toString()),
//             SizedBox(height: 20,),
//             ElevatedButton(
//               onPressed: (){
//                 //ref.read(number.notifier).state++;
//                 ref.watch(number.notifier).update((state) => state+1);
//
//
//                 if(ref.watch(number) == 5){
//                   print("this is the number ${ref.watch(number)}");
//                 }
//               },
//               child: Text('+'),
//             ),
//             SizedBox(height: 20,),
//
//             ElevatedButton(
//               onPressed: (){
//                 //ref.read(number.notifier).state++;
//                 //ref.read(number.notifier).update((state) => state+1);
//                 //ref.refresh(number);
//                 //ref.invalidate(number);
//
//               },
//               child: Text('Refresh'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
