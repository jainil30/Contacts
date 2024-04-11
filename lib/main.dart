import 'package:contacts/screens/add_contact.dart';
import 'package:contacts/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'controllers/category_controller.dart';
import 'controllers/contact_controller.dart';
import 'custom_widgets/custom_scaffold.dart';
import 'models/category.dart';
import 'models/contact.dart';
import 'screens/create_category_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  print("Registering Adapters");
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ContactAdapter());

  print("Opening boxes");
  try {
    await Hive.openBox<Category>("category");
    await Hive.openBox<Contact>("contact");
    print("Boxes are open");
  } catch (e) {
    print(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    Get.put(ContactController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00bf8e)),
          primaryColor: const Color(0xff00bf8e)
          // useMaterial3: true,
          ),
      getPages: [
        GetPage(name: "/listContacts", page: () => ContactListScreen()),
        GetPage(name: "/addContact", page: () => AddContactsScreen()),
        GetPage(name: "/addCategory", page: () => AddCategoryScreen()),
      ],
      home: MyScaffold(
          body: AddCategoryScreen(),
          title: "Create and Store Category",
          hasDrawer: true),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contacts',
            ),
          ],
        ),
      ),
    );
  }
}
