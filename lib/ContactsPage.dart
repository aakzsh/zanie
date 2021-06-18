import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact> _contacts;
  List<String> phones = [];
  List<String> contactPhone = [];
  String txtVal = "";
  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  Future<String> findContact(name) async {
    await getContacts();
    _contacts.toSet().forEach((element) {
      if (element.displayName == name) {
        element.phones.toSet().forEach((phone) {
          contactPhone.add(phone.value);
        });
      }
    });
    return contactPhone[0] ?? "no on found";
  }

  @override
  Widget build(BuildContext context) {
    var info;
    return Scaffold(
      appBar: AppBar(
        title: (Text('Contacts')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  txtVal = text;
                },
              ),
              FloatingActionButton(
                child: Text("Make a call"),
                onPressed: () async {
                  info = await findContact(txtVal);
                  launch("tel: $info");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
