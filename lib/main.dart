import 'package:flutter/material.dart';
import 'package:invoice/Invoice_pdf.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Invoice',
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  int invoiceNumber =1;
  var C_Name= TextEditingController();
  var C_company= TextEditingController();
  var C_number= TextEditingController();
  var C_address= TextEditingController();
  int total_price  = 0;
  int productNo= 0;

  var p_name= TextEditingController();
  var p_quintiy= TextEditingController();
  var p_price= TextEditingController();
  List<List<String>> productList = [];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Text('Genaret Invoice'),
        actions: [
          IconButton(onPressed: (){

            InvoicePdf(invoice_No: invoiceNumber,
                c_Name: C_Name.text.toString(),
                c_Company: C_company.text.toString(),
                c_Address: C_address.text.toString(),
                c_Number: C_number.text.toString(),
                subprice: total_price,
                tax: 0,
                items: productList);

            ++invoiceNumber;
            productList.clear();
            C_Name.clear();
            C_address.clear();
            C_company.clear();
            C_number.clear();
            total_price = 0;
            setState(() {
            });
          }, icon: Icon(Icons.print,size: 50,color: Colors.black45)),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
      showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Text('Add Product'),
                TextField(
              controller: p_name,
              decoration: InputDecoration(
                  hintText: 'Product Name'
              ),
            ),
            TextField(
              controller: p_quintiy,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Quentity'
              ),
            ),
                TextField(
                  controller: p_price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Price'
                  ),
                ),
              ],

            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel')),
              ElevatedButton(onPressed: (){
                setState(() {
                  productList.add(['${productNo+1}','${p_name.text.toString()}',
                      '${p_price.text.toString()}',
                    '${p_quintiy.text.toString()}',
                    '${int.parse(p_price.text.toString())*int.parse(p_quintiy.text.toString())}']);
                  Navigator.pop(context);
                  total_price = total_price+ int.parse('${int.parse(p_price.text.toString())*int.parse(p_quintiy.text.toString())}');
                  p_name.clear();
                  p_quintiy.clear();
                  p_price.clear();
                });
              }, child: Text('Add List')),
            ],
          );
        });
        },
        child: Icon(Icons.add,color: Colors.grey,),
        backgroundColor: Colors.grey.shade50,),
      
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 2,
                  child: SizedBox(
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Client Info:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        TextField(
                          controller: C_Name,
                          decoration: InputDecoration(
                            hintText: 'Client Name'
                          ),
                        ),
                        TextField(
                          controller: C_company,
                          decoration: InputDecoration(
                            hintText: 'Client Company Name'
                          ),
                        ),
                        TextField(
                          controller: C_number,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Client Number'
                          ),
                        ),
                        TextField(
                          controller: C_address,
                          decoration: InputDecoration(
                            hintText: 'Client Address'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Invoice\nNo#$invoiceNumber', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                ),
              ],
            ),


            SizedBox(height: 100,),
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade100,border: Border.all(color: Colors.black12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text('No',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),flex: 1,),
                    Expanded(child: Text('Product',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),flex: 7,),
                    Expanded(child: Text('Price',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),flex: 2,),
                    Expanded(child: Text('Quantity',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),flex: 2,),
                    Expanded(child: Text('Total',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),flex: 3,),

                  ],
                ),
              ),
            ),


            SizedBox(height: 2,),
            ListView.builder(
              itemCount: productList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Text('${productList[index][0]}',style: TextStyle(fontSize: 15),),flex: 1,),
                        Expanded(child: Text('${productList[index][1]}',style: TextStyle(fontSize: 15),),flex: 7,),
                        Expanded(child: Text('${productList[index][2]} tk',style: TextStyle(fontSize: 15),),flex: 2,),
                        Expanded(child: Text('${productList[index][3]}',style: TextStyle(fontSize: 15),),flex: 2,),
                        Expanded(child: Text('${productList[index][4]} tk',style: TextStyle(fontSize: 15),),flex: 3,),
                      ],
                    ),
                  ),
                );
                        },),
            SizedBox(height: 60,),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Total Price: $total_price'
                        ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ))),
            SizedBox(height: 60,)


          ],
        ),
      ),
    );
  }
}
