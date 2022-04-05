import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'about_screen.dart';
import 'order.dart';
import 'orders_screen.dart';

enum MenuOption { orderHistory, about }
enum Toppings {
  peanuts,
  mMs,
  almonds,
  brownies,
  strawberries,
  oreos,
  gummyBears,
  marshmallows
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Order> _orders = [];

  var _price = 2.99;
  var _sizeCost = 2.99;
  var _toppingsCost = 0.0;
  var _fudgeCost = 0.0;

  var _selectedSize = "Small";
  final List<String> _sizes = ["Small", "Medium", "Large"];
  var _selectedFlavor = "Vanilla";
  final List<String> _flavors = ["Vanilla", "Chocolate", "Strawberry"];

  var _peanuts = false;
  var _mMs = false;
  var _almonds = false;
  var _brownies = false;
  var _strawberries = false;
  var _oreos = false;
  var _gummyBears = false;
  var _marshmallows = false;

  var _sliderValue = 0;

  //size costs
  final _small = 2.99;
  final _medium = 3.99;
  final _large = 4.99;

  //toppings cost
  final _peanutsCost = 0.15;
  final _mMsCost = 0.25;
  final _almondsCost = 0.15;
  final _browniesCost = 0.20;
  final _strawberriesCost = 0.20;
  final _oreosCost = 0.20;
  final _gummyBearsCost = 0.20;
  final _marshmallowsCost = 0.15;

  //fudge cost
  final _oneOunce = 0.15;
  final _twoOunces = 0.25;
  final _threeOunces = 0.30;

  void handleCheckBox(Toppings topping, bool value) {
    //would prefer use enumeration
    setState(() {
      switch (topping) {
        case Toppings.peanuts:
          _peanuts = value;
          break;
        case Toppings.mMs:
          _mMs = value;
          break;
        case Toppings.almonds:
          _almonds = value;
          break;
        case Toppings.brownies:
          _brownies = value;
          break;
        case Toppings.strawberries:
          _strawberries = value;
          break;
        case Toppings.oreos:
          _oreos = value;
          break;
        case Toppings.gummyBears:
          _gummyBears = value;
          break;
        case Toppings.marshmallows:
          _marshmallows = value;
          break;
      }
    });

    updateToppingsCost(topping, value);
  }

  void selectAll(){ //handle THE WORKS button
    setState(() {
      _peanuts = true;
      _mMs = true;
      _almonds = true;
      _brownies = true;
      _strawberries = true;
      _oreos = true;
      _gummyBears = true;
      _marshmallows = true;
      _sliderValue = 3;
      _selectedSize = _sizes[2];
    });
    _sizeCost = _large;
    _toppingsCost = _peanutsCost + _mMsCost + _almondsCost + _browniesCost +
    _strawberriesCost + _oreosCost + _gummyBearsCost + _marshmallowsCost;
    _fudgeCost = _threeOunces;
    updateCost();
  }
  void resetAll(){ //handle RESET button
    setState(() {
      _peanuts = false;
      _mMs = false;
      _almonds = false;
      _brownies = false;
      _strawberries = false;
      _oreos = false;
      _gummyBears = false;
      _marshmallows = false;
      _sliderValue = 1;
      _selectedSize = _sizes[0];
      _selectedFlavor = _flavors[0];
      _sliderValue = 0;
    });
    _sizeCost = _small;
    _toppingsCost = 0.0;
    _fudgeCost = 0.0;
    updateCost();
  }

  void updateSizeCost(String newValue){
    if(newValue == _sizes[0]){
      _sizeCost = _small;
    }
    else if(newValue == _sizes[1]){
      _sizeCost = _medium;
    }
    else{
      _sizeCost = _large;
    }
    updateCost();
  }

  void updateFudgeCost(double val){
    if(val == 1){
      _fudgeCost = _oneOunce;
    }
    else if(val == 2){
      _fudgeCost = _twoOunces;
    }
    else if(val == 3){
      _fudgeCost = _threeOunces;
    }
    else{
      _fudgeCost = 0.0;
    }
    updateCost();
  }

  void updateToppingsCost(Toppings topping, bool value){
    if(topping == Toppings.peanuts){
      if(value == true){
        _toppingsCost += _peanutsCost;
      }
      else{
        _toppingsCost -= _peanutsCost;
      }
    }
    else if(topping == Toppings.mMs){
      if(value == true){
        _toppingsCost += _mMsCost;
      }
      else{
        _toppingsCost -= _mMsCost;
      }
    }
    else if(topping == Toppings.almonds){
      if(value == true){
        _toppingsCost += _almondsCost;
      }
      else{
        _toppingsCost -= _almondsCost;
      }
    }
    else if(topping == Toppings.brownies){
      if(value == true){
        _toppingsCost += _browniesCost;
      }
      else{
        _toppingsCost -= _browniesCost;
      }
    }
    else if(topping == Toppings.strawberries){
      if(value == true){
        _toppingsCost += _strawberriesCost;
      }
      else{
        _toppingsCost -= _strawberriesCost;
      }
    }
    else if(topping == Toppings.oreos){
      if(value == true){
        _toppingsCost += _oreosCost;
      }
      else{
        _toppingsCost -= _oreosCost;
      }
    }
    else if(topping == Toppings.gummyBears){
      if(value == true){
        _toppingsCost += _gummyBearsCost;
      }
      else{
        _toppingsCost -= _gummyBearsCost;
      }
    }
    else{
      if(value == true){
        _toppingsCost += _marshmallowsCost;
      }
      else{
        _toppingsCost -= _marshmallowsCost;
      }
    }
    updateCost();
  }

  void updateCost(){
    _price = _sizeCost + _toppingsCost + _fudgeCost;
  }

  //popup menu button
  void gotoAboutScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      ),
    );
  }

  void gotoOrdersHistoryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrdersHistoryScreen(
          orders: _orders,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          actions: [
            PopupMenuButton<MenuOption>(
              icon: const Icon(Icons.more_vert, color: Colors.pink),
              color: Colors.pink[50],
              onSelected: (choice) {
                if(choice == MenuOption.about){
                  gotoAboutScreen();
                } else if(choice == MenuOption.orderHistory){
                  gotoOrdersHistoryScreen();
                }
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<MenuOption>>[
                  const PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.history),
                      title: Text("Order History"),
                    ),
                    value: MenuOption.orderHistory,
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Text("About"),
                    ),
                    value: MenuOption.about,
                  )
                ];
              },
            ),
          ],
          title: const Text(
            "Ice Cream Sundae",
            style: TextStyle(
              color: Colors.pink,
              fontFamily: 'Handlee',
              fontSize: 30.0,
            ),
          ),
          backgroundColor: Colors.amber[100],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 70.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/images/sundae.png"),
                        ),
                        Text(
                          "Sundae Maker",
                          style:
                              TextStyle(fontSize: 38.0, fontFamily: "Handlee"),
                        ),
                      ],
                    ),
                    Text(
                      "\$" + _price.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Size: ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Handlee",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        DropdownButton(
                          value: _selectedSize,
                          items: _sizes.map((sizes) {
                            return DropdownMenuItem(
                              child: Text(
                                sizes,
                                style: const TextStyle(
                                  fontFamily: "Handlee",
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),
                              value: sizes,
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSize = newValue!;
                            });
                            updateSizeCost(newValue!);
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Flavor: ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Handlee",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        DropdownButton(
                          value: _selectedFlavor,
                          items: _flavors.map((flavors) {
                            return DropdownMenuItem(
                              child: Text(
                                flavors,
                                style: const TextStyle(
                                  fontFamily: "Handlee",
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),
                              value: flavors,
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedFlavor = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(
                          children: [
                            CheckboxListTile(
                              activeColor: Colors.brown,
                              side: const BorderSide(color: Colors.pink),
                              value: _peanuts,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.peanuts, val!);
                              },
                              title: const Text("Peanuts",style: TextStyle(fontFamily: "Handlee", fontSize: 20.0)),
                            ),
                            CheckboxListTile(
                              activeColor: Colors.green,
                              side: const BorderSide(color: Colors.pink),
                              value: _mMs,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.mMs, val!);
                              },
                              title: const Text("M&Ms", style: TextStyle(fontFamily: "Handlee", fontSize: 20.0),),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            CheckboxListTile(
                              activeColor: Colors.brown[300],
                              side: const BorderSide(color: Colors.pink),
                              value: _almonds,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.almonds, val!);
                              },
                              title: const Text("Almonds", style: TextStyle(fontFamily: "Handlee", fontSize: 20.0),),
                            ),
                            CheckboxListTile(
                              activeColor: Colors.brown[800],
                              side: const BorderSide(color: Colors.pink),
                              value: _brownies,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.brownies, val!);
                              },
                              title: const Text("Brownies", style: TextStyle(fontFamily: "Handlee", fontSize: 20.0),),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            CheckboxListTile(
                              activeColor: Colors.pink,
                              side: const BorderSide(color: Colors.pink),
                              value: _strawberries,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.strawberries, val!);
                              },
                              title: const Text("Strawberries", style: TextStyle(fontFamily: "Handlee", fontSize: 20.0),),
                            ),
                            CheckboxListTile(
                              activeColor: Colors.black,
                              side: const BorderSide(color: Colors.pink),
                              value: _oreos,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.oreos, val!);
                              },
                              title: const Text("Oreos", style: TextStyle(fontFamily: "Handlee", fontSize: 20.0),),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            CheckboxListTile(
                              activeColor: Colors.red[800],
                              side: const BorderSide(color: Colors.pink),
                              value: _gummyBears,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.gummyBears, val!);
                              },
                              title: const Text("Gummy Bears", style: TextStyle(fontFamily: "Handlee", fontSize: 20.0),),
                            ),
                            CheckboxListTile(
                              activeColor: Colors.grey[600],
                              side: const BorderSide(color: Colors.pink),
                              value: _marshmallows,
                              onChanged: (bool? val) {
                                handleCheckBox(Toppings.marshmallows, val!);
                              },
                              title: const Text("Marshmallows", style: TextStyle(fontFamily: "Handlee", fontSize: 18.0),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    const Text("Fudge: ", style: TextStyle(fontFamily: "Handlee", fontSize: 20.0, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Slider(
                        thumbColor: Colors.pink,
                        activeColor: Colors.brown[800],
                        value: _sliderValue.toDouble(),
                        min: 0.0,
                        max: 3.0,
                        label: _sliderValue.toString(),
                        divisions: 3,
                        onChanged: (double val) {
                          setState(() {
                            _sliderValue = val.toInt();
                          });
                          updateFudgeCost(val);
                        },
                      ),
                    ),
                    Text(_sliderValue.toString() + " oz", style: const TextStyle(fontFamily: "Handlee", fontSize: 15.0, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          selectAll();
                        },
                        child: const Text("The Works",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0,),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          resetAll();
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0,),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          //instantiate an order item & add it to the array list when an order is made
                          var _currentDate = DateTime.now().toString();
                          _orders.add(Order(_currentDate, _selectedFlavor, _selectedSize, _price.toStringAsFixed(2)));
                          Fluttertoast.showToast(
                              msg: "Your sundae is on the way. Enjoy!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.yellow[200],
                              textColor: Colors.black);
                          //updateSizeCost(newValue);
                          //reset after order is made back to default
                          resetAll();
                        },
                        child: const Text("Order",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
