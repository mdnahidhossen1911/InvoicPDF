# InvoicPDF

        >> dart pub add pdf

      

                 var item = [
                   ['1', 'Description of item 1', '1', '\$100.00', '\$100.00'],
                   ['2', 'Description of item 2', '2', '\$150.00', '\$300.00'],
                 ];

                 InvoicePdf(c_Name: 'Nahid Hossen',
                     c_Address: 'santosh',
                     c_Company: 'hnk',
                     c_Number: '345234',
                     invoice_No: 456,
                     subprice: 34,
                     items: item,
                     tax: 0);
