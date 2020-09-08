import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change the name";
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome Start"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: [
                  Image.asset("assets/abc.jpeg"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    myText,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: "Your Name",
                          labelText: "Name",
                          border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1524844048540-48a73fc4b2ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                    ),
                    accountName: Text("Shuvam"),
                    accountEmail: Text("shuvamkumar71@gmail.com")),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Shuvam"),
                  subtitle: Text("Developer"),
                  trailing: Icon(Icons.edit),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Email"),
                  subtitle: Text("shuvamkumar71@gmail.com"),
                  trailing: Icon(Icons.edit),
                  onTap: () {},
                )
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
