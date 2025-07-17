import 'package:flutter/material.dart';

class myForm extends StatefulWidget {
  const myForm({super.key, required this.onSubmit});
  final Function(String?) onSubmit;

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<myForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? _name;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
      widget.onSubmit(_nameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                label: Text(
                  "Enter your name",
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState!.save();
                widget.onSubmit(_name);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
