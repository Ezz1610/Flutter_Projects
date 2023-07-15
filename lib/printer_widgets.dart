import 'package:flutter/material.dart';


// company name
Widget compnayName() {
  return const Text('ALQ', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold));
}

// branch name
Widget branchName() {
  return const Text('فرع الازدهار', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold));
}

// vat no
Widget vatNo() {
  return const Text('VAT No.: 34343434443434', style: TextStyle(color: Colors.black, fontSize: 18));
}

// order no
Widget orderNo() {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: 200,
    height: 50,
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    child: const Text('#210', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
  );
}

// cashier name & posting date
Widget cashierNameAndPostingDate() {
  return Container(
    padding: const EdgeInsets.all(6),
    child: const Text('Pos Pos | 25-05-2012 13:52:12', style: TextStyle(color: Colors.black, fontSize: 18)),
  );
}

// invoice status & order type
Widget invoiceStatusAndOrderType() {
  return Container(
    padding: const EdgeInsets.all(6),
    child: const Text('Paid | Takeaway', style: TextStyle(color: Colors.black, fontSize: 18)),
  );
}

// table header
Widget tableHeader() {
  return const SizedBox(
    width: 420,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 2, child: Text('الكمية', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
        Flexible(
          flex: 6,
          fit: FlexFit.tight,
          child: Text(
            'الصنف',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 10,
            textAlign: TextAlign.start,
          ),
        ),
        Flexible(
            flex: 2,
            child: Text(
              'السعر',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ],
    ),
  );
}

// table item row
Widget tableItemRow() {
  return const SizedBox(
    // padding: EdgeInsets.symmetric(vertical: 6),
    width: 420,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 2, child: Text('300', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
        Flexible(
          flex: 6,
          fit: FlexFit.tight,
          child: Text('عصير مانجا',
              maxLines: 10, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Flexible(flex: 2, child: Text('50000', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
      ],
    ),
  );
}

// table fotter
Widget tableFotter() {
  return const SizedBox(
    width: 420,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 2, child: Text('الضريبة', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Text(
                '',
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 10,
                textAlign: TextAlign.start,
              ),
            ),
            Flexible(
                flex: 2,
                child: Text(
                  '150',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 2, child: Text('الاجمالي', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Text(
                '',
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 10,
                textAlign: TextAlign.start,
              ),
            ),
            Flexible(
                flex: 2,
                child: Text(
                  '2000',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    ),
  );
}

// invoice refernce no
Widget referenceNoAndPrintTime() {
  return const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(' POS354635403 | 334345434', style: TextStyle(color: Colors.black, fontSize: 18)),
      Text('25-05-2012 13:52:12', style: TextStyle(color: Colors.black, fontSize: 18)),
    ],
  );
}

// divider
Widget divider() {
  return const SizedBox(
    width: 420,
    height: 10,
    child: Divider(
      thickness: 1.5,
      color: Colors.black,
    ),
  );
}
