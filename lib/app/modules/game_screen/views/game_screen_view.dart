import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:word_game/app/routes/app_pages.dart';

import '../controllers/game_screen_controller.dart';

class GameScreenView extends GetView<GameScreenController> {
  const GameScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Build grid
            Expanded(
              child: GridView.builder(
                itemCount: controller.rowCount * controller.columnCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: controller.columnCount,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  int row = index ~/ controller.columnCount;
                  int col = index % controller.columnCount;
                  return SizedBox(
                    child: TextFormField(
                      controller: controller.textFieldController[row][col],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Button to submit
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero))),
                onPressed: () {
                  // Print the entered alphabets
                  List<String> alphabets = [];
                  for (int i = 0; i < controller.rowCount; i++) {
                    for (int j = 0; j < controller.columnCount; j++) {
                      alphabets.add(controller.textFieldController[i][j].text);
                    }
                  }
                  print('Entered alphabets: $alphabets');
                  // Here you can process the entered alphabets as needed

                  Get.toNamed(Routes.SEARCH_WORD, arguments: [
                    controller.textFieldController,
                    controller.rowCount,
                    controller.columnCount
                  ]);
                },
                child: Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AlphabetGridPage extends StatefulWidget {
//   @override
//   _AlphabetGridPageState createState() => _AlphabetGridPageState();
// }

// class _AlphabetGridPageState extends State<AlphabetGridPage> {
//   // Dimensions of the grid
//   final int rows = 5;
//   final int cols = 5;

//   // Controller for each text field
//   List<List<TextEditingController>> controllers = [];

//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers
//     for (int i = 0; i < rows; i++) {
//       List<TextEditingController> rowControllers = [];
//       for (int j = 0; j < cols; j++) {
//         rowControllers.add(TextEditingController());
//       }
//       controllers.add(rowControllers);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alphabet Grid'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Build grid
//             Expanded(
//               child: GridView.builder(
//                 itemCount: rows * cols,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: cols,
//                   crossAxisSpacing: 0,
//                   mainAxisSpacing: 0,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   int row = index ~/ cols;
//                   int col = index % cols;
//                   return SizedBox(
//                     child: TextField(
//                       controller: controllers[row][col],
//                       maxLength: 1,
//                       textAlign: TextAlign.center,
//                       decoration: InputDecoration(
//                         counterText: "",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Button to submit
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Print the entered alphabets
//                 List<String> alphabets = [];
//                 for (int i = 0; i < rows; i++) {
//                   for (int j = 0; j < cols; j++) {
//                     alphabets.add(controllers[i][j].text);
//                   }
//                 }
//                 print('Entered alphabets: $alphabets');
//                 // Here you can process the entered alphabets as needed
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
