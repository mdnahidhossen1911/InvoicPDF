import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoicePdf {


   int invoice_No= 0;
   String c_Name ='';
   String c_Company ='';
   String c_Address ='';
   String c_Number ='';
   int subprice = 0;
   int tax = 0;
   List<List<String>> items = [];

   InvoicePdf({required this.invoice_No, required this.c_Name, required this.c_Company, required this.c_Address,
      required this.c_Number, required this.subprice, required this.tax, required this.items}){

     _generatePDF();
   }


  Future<void> _generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            buildHeader(),
            pw.SizedBox(height: 10),
            buildInvoiceInfo(),
            pw.SizedBox(height: 20),
            buildItemsTable(),
            pw.SizedBox(height: 20),
            buildTotal(),
          ];
        },
      ),
    );

    final desktopPath = Platform.environment['USERPROFILE'] ?? '';
    final filePath = '$desktopPath/Desktop/invoice#$invoice_No.pdf';
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    print('PDF saved to $filePath');
  }

  pw.Widget buildHeader() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Nahid Alloy Comppany', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
        pw.Text('123 Main Street, City, Country'),
        pw.Text('Email:nahidhossen@gmail.com'),
        pw.Text('Phone: +880 1519112003'),
        pw.SizedBox(height: 8),
        pw.Text('Invoice', style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
      ],
    );
  }

  pw.Widget buildInvoiceInfo() {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Bill To:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Client Name: $c_Name'),
            pw.Text('Client Company: $c_Company'),
            pw.Text('Client number: $c_Number'),
            pw.Text('Client Address: $c_Address'),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Invoice #: $invoice_No'),
            pw.Text('Date: ${DateTime.now().toString().split(" ")[0]}'),
          ],
        ),
      ],
    );
  }

  pw.Widget buildItemsTable() {
    const headers = ['No', 'Product', 'Quantity', 'Unit Price', 'Total'];


    return pw.Table.fromTextArray(
      headers: headers,
      data: items,
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 27,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.centerRight,
      },
    );
  }

  pw.Widget buildTotal() {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Container(
          width: 200,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Subtotal:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('$subprice'),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Tax ($tax%):', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('\$100.00'),
                ],
              ),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Total:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.Text('\$1100.00', style: pw.TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}