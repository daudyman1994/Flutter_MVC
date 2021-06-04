import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zocial_admin/widget/widget.dart';
import 'package:zocial_admin/model/model.dart' show CityModel;

class CityNewEvent extends StatefulWidget {
  CityNewEvent({Key? key}) : super(key: key);
  static String appbarTitle = "create new event";
  static String routeName = "/city/city_new_event";
  @override
  _CityNewEventState createState() => _CityNewEventState();
}

class _CityNewEventState extends State<CityNewEvent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String errorMsg = "";
  late String _email;
  late String _password;
  late String _displayName;
  late bool _loading = false;
  late bool _autoValidate = false;

  var _currentSelectedValue;
  late List<String> _cities;
  // late String errorMsg = "";
  @override
  void initState() {
    super.initState();
    // _cities = CityModel.instance.cityNameList;
    _cities = CityModel.instance.cityNameList;
  }

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: CityNewEvent.appbarTitle.toUpperCase(),
        subtitle: "",
        pushable: true,
        actionIcon: false,
      ),
      // drawer: widget.androidDrawer,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: 20,
                  ),
                  child: CustomTextField(
                    onSaved: (input) {
                      // this._email = input!;
                    },
                    // validator: emailValidator,
                    hint: "Title",
                    label: "Title of the Event",
                    minlines: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CustomTextField(
                    onSaved: (input) {
                      print(input);
                    },
                    validator: (input) => input!.isEmpty ? "*Required" : null,
                    label: "Description",
                    hint: "Here can a descriptioin Text be placed.",
                    minlines: 3,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "Max Persons",
                          hint: "2",
                          minlines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "Price Per Person:",
                          hint: "Z.B. 200E",
                          minlines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "Date:",
                          hint: "12.02.2021",
                          minlines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "Time of State:",
                          hint: "16:20 Uhr",
                          minlines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "Street",
                          hint: "London Street",
                          minlines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "Nmbr:",
                          hint: "3",
                          minlines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "Post Code",
                          hint: "85764",
                          minlines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          onSaved: (input) {
                            print(input);
                          },
                          validator: (input) =>
                              input!.isEmpty ? "*Required" : null,
                          label: "City:",
                          hint: "Obsearch",
                          minlines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  hintText: 'Please select expense',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xff707070),
                                      width: 2,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xff707070),
                                      width: 3,
                                    ),
                                  ),
                                ),
                                // isEmpty: _currentSelectedValue == '',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _currentSelectedValue,
                                    isDense: true,
                                    onChanged: (String? newValue) async {
                                      setState(() {
                                        _currentSelectedValue = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _cities.map((String? value) {
                                      // print("Value is here ========$value");
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value!),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xff29E145),
                            child: IconButton(
                              iconSize: 40,
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.check, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
